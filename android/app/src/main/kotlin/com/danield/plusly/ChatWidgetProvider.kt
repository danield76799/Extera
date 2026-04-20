package com.danield.plusly

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.widget.RemoteViews
import android.app.PendingIntent
import org.json.JSONArray
import java.io.File
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

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
        private const val COLOR_OFFLINE = "#9E9E9E"  // Gray
        private const val COLOR_HEADER = "#6750A4"    // Purple

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.plusly_widget)
            
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
                    val timeId = when (i) {
                        0 -> R.id.chat_time_1
                        1 -> R.id.chat_time_2
                        2 -> R.id.chat_time_3
                        3 -> R.id.chat_time_4
                        else -> 0
                    }
                    
                    views.setTextViewText(nameId, chat.first)
                    views.setTextViewText(messageId, chat.second)
                    views.setTextViewText(timeId, chat.fourth)
                    val statusColor = if (chat.third) COLOR_ONLINE else COLOR_OFFLINE
                    views.setTextColor(statusId, Color.parseColor(statusColor))
                    views.setOnClickPendingIntent(rowId, pendingIntent)
                }
            } else {
                // Show welcome message
                views.setTextViewText(R.id.chat_name_1, "💬 Plusly")
                views.setTextViewText(R.id.chat_message_1, "Open de app om chats te zien")
                views.setTextViewText(R.id.chat_time_1, "")
                views.setTextColor(R.id.chat_status_1, Color.parseColor(COLOR_ONLINE))
                views.setOnClickPendingIntent(R.id.chat_row_1, pendingIntent)
                
                // Hide other rows
                views.setViewVisibility(R.id.chat_row_2, android.view.View.GONE)
                views.setViewVisibility(R.id.chat_row_3, android.view.View.GONE)
                views.setViewVisibility(R.id.chat_row_4, android.view.View.GONE)
            }
            
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun readChatData(context: Context): List<Quadruple<String, String, Boolean, String>> {
            // Returns List of (name, message, isOnline, timestamp)
            return try {
                val file = File(context.filesDir, CHAT_DATA_FILE)
                if (!file.exists()) return emptyList()
                
                val json = file.readText()
                val jsonArray = JSONArray(json)
                val result = mutableListOf<Quadruple<String, String, Boolean, String>>()
                
                for (i in 0 until jsonArray.length()) {
                    val chat = jsonArray.getJSONObject(i)
                    val name = chat.optString("name", "")
                    val message = chat.optString("lastMessage", "")
                    val isOnline = chat.optBoolean("isOnline", false)
                    val timestamp = chat.optString("timestamp", "")
                    if (name.isNotEmpty()) {
                        result.add(Quadruple(name, message, isOnline, timestamp))
                    }
                }
                result
            } catch (e: Exception) {
                emptyList()
            }
        }
    }
}

// Simple quadruple class
data class Quadruple<A, B, C, D>(val first: A, val second: B, val third: C, val fourth: D)
