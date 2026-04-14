package com.danield.extrachat

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import android.app.PendingIntent
import android.content.Intent
import org.json.JSONArray
import java.io.File
import android.view.View
import android.graphics.Color

class ChatWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
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
        private const val MAX_CHATS = 6

        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.chat_widget)

            // Read chat data from file written by Flutter
            val chatDataJson = try {
                val file = File(context.cacheDir, CHAT_DATA_FILE)
                if (file.exists()) file.readText() else "[]"
            } catch (e: Exception) {
                "[]"
            }

            try {
                val chats = JSONArray(chatDataJson)
                val chatCount = minOf(chats.length(), MAX_CHATS)

                // Clear all chat views first
                for (i in 1..MAX_CHATS) {
                    views.setViewVisibility(getChatRowId(i), View.GONE)
                }

                // Populate chat views
                for (i in 0 until chatCount) {
                    val chat = chats.getJSONObject(i)
                    val rowId = getChatRowId(i + 1)
                    views.setViewVisibility(rowId, View.VISIBLE)

                    // Name
                    val name = chat.getString("name")
                    views.setTextViewText(getNameId(i + 1), name)

                    // Last message (truncated)
                    var message = chat.getString("lastMessage")
                    if (message.length > MAX_CHARS) {
                        message = message.take(MAX_CHARS) + "…"
                    }
                    views.setTextViewText(getMessageId(i + 1), message)

                    // Online indicator color
                    val isOnline = chat.optBoolean("isOnline", false)
                    val statusColor = if (isOnline) Color.parseColor("#4CAF50") else Color.parseColor("#9E9E9E")
                    views.setInt(getStatusId(i + 1), "setColorFilter", statusColor)

                    // Set click intent to open chat
                    val chatId = chat.getString("chatId")
                    val intent = Intent(context, MainActivity::class.java).apply {
                        action = "com.danield.extrachat.OPEN_CHAT"
                        putExtra("chatId", chatId)
                        flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                    }
                    val pendingIntent = PendingIntent.getActivity(
                        context,
                        i,
                        intent,
                        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                    )
                    views.setOnClickPendingIntent(rowId, pendingIntent)
                }

                // Show/hide empty state
                if (chatCount == 0) {
                    views.setViewVisibility(R.id.widget_empty, View.VISIBLE)
                } else {
                    views.setViewVisibility(R.id.widget_empty, View.GONE)
                }

            } catch (e: Exception) {
                e.printStackTrace()
                views.setViewVisibility(R.id.widget_empty, View.VISIBLE)
            }

            // Update the widget
            appWidgetManager.updateAppWidget(appWidgetId, views)
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
