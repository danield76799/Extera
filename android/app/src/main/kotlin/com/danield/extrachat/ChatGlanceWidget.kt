package com.danield.extrachat

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.*
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import androidx.glance.appwidget.*
import androidx.glance.layout.*
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import org.json.JSONArray
import java.io.File

class ChatGlanceWidget : GlanceAppWidget() {

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            ChatWidgetContent(context)
        }
    }

    @Composable
    private fun ChatWidgetContent(context: Context) {
        val chatData = loadChatData(context)
        
        GlanceTheme {
            Column(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .background(ColorProvider(android.R.color.white))
                    .padding(12.dp)
            ) {
                // Header
                Row(
                    modifier = GlanceModifier
                        .fillMaxWidth()
                        .padding(bottom = 8.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = "ExtraChat",
                        style = TextStyle(
                            fontWeight = FontWeight.Bold,
                            fontSize = 18.sp,
                            color = ColorProvider(android.R.color.holo_purple)
                        )
                    )
                }
                
                HorizontalDivider()
                
                Spacer(modifier = GlanceModifier.height(8.dp))
                
                // Chat list
                if (chatData.isEmpty()) {
                    Box(
                        modifier = GlanceModifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Text(
                            text = "No chats available",
                            style = TextStyle(
                                fontSize = 14.sp,
                                color = ColorProvider(android.R.color.darker_gray)
                            )
                        )
                    }
                } else {
                    chatData.take(4).forEach { chat ->
                        ChatRow(
                            name = chat.name,
                            message = chat.message,
                            onClick = { }
                        )
                        Spacer(modifier = GlanceModifier.height(4.dp))
                    }
                }
            }
        }
    }

    @Composable
    private fun ChatRow(
        name: String,
        message: String,
        onClick: () -> Unit
    ) {
        Row(
            modifier = GlanceModifier
                .fillMaxWidth()
                .background(ColorProvider(android.R.color.transparent))
                .clickable(actionStartActivity<MainActivity>())
                .padding(vertical = 4.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Avatar placeholder
            Box(
                modifier = GlanceModifier
                    .size(36.dp)
                    .background(ColorProvider(android.R.color.holo_purple)),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = name.take(1).uppercase(),
                    style = TextStyle(
                        color = ColorProvider(android.R.color.white),
                        fontWeight = FontWeight.Bold,
                        fontSize = 14.sp
                    )
                )
            }
            
            Spacer(modifier = GlanceModifier.width(10.dp))
            
            Column(
                modifier = GlanceModifier.defaultWeight()
            ) {
                Text(
                    text = name,
                    style = TextStyle(
                        fontWeight = FontWeight.Medium,
                        fontSize = 14.sp,
                        color = ColorProvider(android.R.color.black)
                    ),
                    maxLines = 1
                )
                Spacer(modifier = GlanceModifier.height(2.dp))
                Text(
                    text = message,
                    style = TextStyle(
                        fontSize = 12.sp,
                        color = ColorProvider(android.R.color.darker_gray)
                    ),
                    maxLines = 1
                )
            }
        }
    }

    private fun loadChatData(context: Context): List<ChatItem> {
        return try {
            val file = File(context.cacheDir, "chat_widget_data.json")
            if (file.exists()) {
                val json = file.readText()
                val jsonArray = JSONArray(json)
                (0 until jsonArray.length()).mapNotNull { i ->
                    val obj = jsonArray.getJSONArray(i)
                    if (obj.length() >= 2) {
                        ChatItem(
                            name = obj.getString(0),
                            message = obj.getString(1),
                            time = if (obj.length() >= 3) obj.getString(2) else ""
                        )
                    } else null
                }
            } else {
                getTestData()
            }
        } catch (e: Exception) {
            getTestData()
        }
    }
    
    private fun getTestData(): List<ChatItem> {
        return listOf(
            ChatItem("Chat 1", "Tap to open chat", ""),
            ChatItem("Chat 2", "Tap to open chat", ""),
            ChatItem("Chat 3", "Tap to open chat", ""),
            ChatItem("Chat 4", "Tap to open chat", "")
        )
    }
}

data class ChatItem(
    val name: String,
    val message: String,
    val time: String
)
