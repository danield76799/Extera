package com.danield.extrachat

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.app.PendingIntent
import android.view.View

class ChatWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            Companion.updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onEnabled(context: Context) {
        // Widget is added for the first time
    }

    override fun onDisabled(context: Context) {
        // Widget is removed
    }

    companion object {
        private const val MAX_CHATS = 4

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.extrachat_widget)
            views.setTextViewText(R.id.widget_header, "Chats")
            
            // Show test data
            val testChats = listOf(
                Pair("Chat 1", "Last message here"),
                Pair("Chat 2", "Last message here"),
                Pair("Chat 3", "Last message here"),
                Pair("Chat 4", "Last message here")
            )
            
            for ((i, chat) in testChats.withIndex()) {
                val rowId = getChatRowId(i + 1)
                val nameId = getNameId(i + 1)
                val messageId = getMessageId(i + 1)
                views.setViewVisibility(rowId, View.VISIBLE)
                views.setTextViewText(nameId, chat.first)
                views.setTextViewText(messageId, chat.second)
            }
            
            // Make entire widget clickable to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_header, pendingIntent)
            
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun getChatRowId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_row_1
                2 -> R.id.chat_row_2
                3 -> R.id.chat_row_3
                4 -> R.id.chat_row_4
                else -> 0
            }
        }

        private fun getNameId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_name_1
                2 -> R.id.chat_name_2
                3 -> R.id.chat_name_3
                4 -> R.id.chat_name_4
                else -> 0
            }
        }

        private fun getMessageId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_message_1
                2 -> R.id.chat_message_2
                3 -> R.id.chat_message_3
                4 -> R.id.chat_message_4
                else -> 0
            }
        }
    }
}
