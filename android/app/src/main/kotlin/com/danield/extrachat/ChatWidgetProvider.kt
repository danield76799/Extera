package com.danield.extrachat

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.widget.RemoteViews
import android.app.PendingIntent
import org.json.JSONArray
import java.io.File

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
        private const val COLOR_ONLINE = "#4CAF50"   // Green
        private const val COLOR_OFFLINE = "#888888"   // Gray

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.extrachat_widget)
            views.setTextViewText(R.id.widget_header, "Chats")
            
            // Create intent to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            
            // Try to read real chat data from file
            val chatData = readChatData(context)
            
            if (chatData.isNotEmpty()) {
                // Show real chat data
                for (i in chatData.indices) {
                    if (i >= 4) break
                    val chat = chatData[i]
                    val rowId = when (i) {
                        0 -> R.id.chat_row_1
                        1 -> R.id.chat_row_2
                        2 -> R.id.chat_row_3
                        3 -> R.id.chat_row_4
                        else -> continue
                    }
                    val nameId = when (i) {
                        0 -> R.id.chat_name_1
                        1 -> R.id.chat_name_2
                        2 -> R.id.chat_name_3
                        3 -> R.id.chat_name_4
                        else -> 0
                    }
                    val messageId = when (i) {
                        0 -> R.id.chat_message_1
                        1 -> R.id.chat_message_2
                        2 -> R.id.chat_message_3
                        3 -> R.id.chat_message_4
                        else -> 0
                    }
                    val statusId = when (i) {
                        0 -> R.id.chat_status_1
                        1 -> R.id.chat_status_2
                        2 -> R.id.chat_status_3
                        3 -> R.id.chat_status_4
                        else -> 0
                    }
                    
                    views.setTextViewText(nameId, chat.first)
                    views.setTextViewText(messageId, chat.second)
                    val statusColor = if (chat.third) COLOR_ONLINE else COLOR_OFFLINE
                    views.setTextColor(statusId, Color.parseColor(statusColor))
                    views.setOnClickPendingIntent(rowId, pendingIntent)
                }
            } else {
                // Show welcome message
                views.setTextViewText(R.id.chat_name_1, "💬 ExtraChat")
                views.setTextViewText(R.id.chat_message_1, "Your chats appear here in 5 min")
                views.setTextViewText(R.id.chat_status_1, "●")
                views.setTextColor(R.id.chat_status_1, Color.parseColor(COLOR_ONLINE))
                views.setOnClickPendingIntent(R.id.chat_row_1, pendingIntent)
                
                // Hide other rows
                views.setViewVisibility(R.id.chat_row_2, android.view.View.GONE)
                views.setViewVisibility(R.id.chat_row_3, android.view.View.GONE)
                views.setViewVisibility(R.id.chat_row_4, android.view.View.GONE)
            }
            
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun readChatData(context: Context): List<Triple<String, String, Boolean>> {
            return try {
                val file = File(context.filesDir, CHAT_DATA_FILE)
                if (!file.exists()) return emptyList()
                
                val json = file.readText()
                val jsonArray = JSONArray(json)
                val result = mutableListOf<Triple<String, String, Boolean>>()
                
                for (i in 0 until jsonArray.length()) {
                    val chat = jsonArray.getJSONObject(i)
                    val name = chat.optString("name", "")
                    val message = chat.optString("lastMessage", "")
                    val isOnline = chat.optBoolean("isOnline", false)
                    if (name.isNotEmpty()) {
                        result.add(Triple(name, message, isOnline))
                    }
                }
                result
            } catch (e: Exception) {
                emptyList()
            }
        }
    }
}
