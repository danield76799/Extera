                        // Platform icon overlay for bridge rooms
                        if (isBridgeRoom(room))
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: getBridgeTypeColor(getBridgeType(room) ?? 'other'),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: backgroundColor,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                getBridgeTypeIcon(getBridgeType(room) ?? 'other'),
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      displayname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontWeight: FontWeight.w600, // Semi-bold
                        color: Colors.black, // #000000
                      ),
                    ),
                  ),