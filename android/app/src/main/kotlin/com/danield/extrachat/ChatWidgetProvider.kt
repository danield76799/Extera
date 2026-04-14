package com.danield.extrachat

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.app.PendingIntent

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
        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.extrachat_widget)
            views.setTextViewText(R.id.widget_header, "Chats")
            
            // Test data
            val testChats = listOf(
                Pair("Alice", "Hey, how are you?"),
                Pair("Bob", "See you tomorrow!"),
                Pair("Charlie", "Thanks for the help"),
                Pair("Diana", "Meeting at 3pm")
            )
            
            views.setTextViewText(R.id.chat_name_1, testChats[0].first)
            views.setTextViewText(R.id.chat_message_1, testChats[0].second)
            views.setTextViewText(R.id.chat_name_2, testChats[1].first)
            views.setTextViewText(R.id.chat_message_2, testChats[1].second)
            views.setTextViewText(R.id.chat_name_3, testChats[2].first)
            views.setTextViewText(R.id.chat_message_3, testChats[2].second)
            views.setTextViewText(R.id.chat_name_4, testChats[3].first)
            views.setTextViewText(R.id.chat_message_4, testChats[3].second)
            
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
    }
}
