package com.danield.extrachat

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.*
import androidx.glance.appwidget.*
import androidx.glance.layout.*
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider

class ChatGlanceWidget : GlanceAppWidget() {

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            GlanceTheme {
                Column(
                    modifier = GlanceModifier
                        .fillMaxSize()
                        .background(ColorProvider(Color(0xFF3F51B5)))
                        .padding(12.dp)
                ) {
                    Text(
                        text = "ExtraChat",
                        style = TextStyle(
                            fontWeight = FontWeight.Bold,
                            fontSize = 18.sp,
                            color = ColorProvider(Color.White)
                        )
                    )
                    
                    Spacer(modifier = GlanceModifier.height(8.dp))
                    
                    Text(
                        text = "Tap to open chat",
                        style = TextStyle(
                            fontSize = 14.sp,
                            color = ColorProvider(Color.White)
                        )
                    )
                }
            }
        }
    }
}
