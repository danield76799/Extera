package com.danield.extrachat

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews

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
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
