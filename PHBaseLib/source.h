Config config {
    "version":"2.0",
    "response":"json",
    "pods":"YES",
    "filename":"PHSystem",
    "request":"json"
}

message PHSystemSound {
    optional int soundId = 0;
    optional string filename = nil;
}

message PHKeyConfig {
    optional string baiduMapKey = nil;//百度地图
    optional string jPushKey = nil;//极光推送
    optional string jPushSecret = nil;//极光推送
}






































