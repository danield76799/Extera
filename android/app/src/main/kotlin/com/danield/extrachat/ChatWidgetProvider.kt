package com.danield.extrachat

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import android.app.PendingIntent
import android.content.Intent
import org.json.JSONArray
import java.io.File
import android.util.Log
import android.view.View
import android.graphics.Color

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
        private const val CHAT_DATA_FILE = "chat_widget_data.json"
        private const val MAX_CHARS = 40
        private const val MAX_CHATS = 4

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            try {
                // Simple test: just show the widget with static text
                val views = RemoteViews(context.packageName, R.layout.chat_widget)
                
                // Show all chat rows as visible with test data
                for (i in 1..MAX_CHATS) {
                    views.setViewVisibility(getChatRowId(i), View.VISIBLE)
                    views.setTextViewText(getNameId(i), "Chat $i")
                    views.setTextViewText(getMessageId(i), "Last message here")
                }
                views.setViewVisibility(R.id.widget_empty, View.GONE)
                views.setTextViewText(R.id.widget_header, "ExteraChat Widget")
                
                // Update the widget
                appWidgetManager.updateAppWidget(appWidgetId, views)
            } catch (e: Exception) {
                Log.e("ChatWidget", "Error in updateAppWidget: ${e.message}", e)
            }
        }

        private fun getChatRowId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_row_1
                2 -> R.id.chat_row_2
                3 -> R.id.chat_row_3
                4 -> R.id.chat_row_4
                5 -> R.id.chat_row_5
                6 -> R.id.chat_row_6
                else -> 0
            }
        }

        private fun getNameId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_name_1
                2 -> R.id.chat_name_2
                3 -> R.id.chat_name_3
                4 -> R.id.chat_name_4
                5 -> R.id.chat_name_5
                6 -> R.id.chat_name_6
                else -> 0
            }
        }

        private fun getMessageId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_message_1
                2 -> R.id.chat_message_2
                3 -> R.id.chat_message_3
                4 -> R.id.chat_message_4
                5 -> R.id.chat_message_5
                6 -> R.id.chat_message_6
                else -> 0
            }
        }

        private fun getStatusId(index: Int): Int {
            return when (index) {
                1 -> R.id.chat_status_1
                2 -> R.id.chat_status_2
                3 -> R.id.chat_status_3
                4 -> R.id.chat_status_4
                5 -> R.id.chat_status_5
                6 -> R.id.chat_status_6
                else -> 0
            }
        }
    }
}
