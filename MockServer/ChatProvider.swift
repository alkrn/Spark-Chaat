import Foundation
class Server {
    static func delay(_ data: Data?, error: Error? = nil, callback: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.3 ..< 3.0)) {
            callback(data, error)
        }
    }

    static func me(callback: @escaping (Data?, Error?) -> Void) {
        let data = """
        {
            "id": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
            "first_name": "Ali",
            "last_name": "Kıran",
            "gender": "MALE",
            "email": "away4m@gmail.com",
            "percent_complete": 56,
            "location": "u1x0ektjtttq:Hamburg, Germany",
            "birthday": "1983-02-09T00:00:00Z",
            "permissions": [
                "MESSAGE_READ_RECEIPT",
                "HIDE_PRESENCE",
                "MESSAGING",
                "HIDE_PROFILE",
                "INCOGNITO",
                "LIKED_ME"
            ],
            "preferred_language": "en",
            "created_at": "2019-02-11T22:02:15.524243Z",
            "country": "DE",
            "payment_gateway": "CS_COMP_GATEWAY",
            "account_status": "A",
            "preferred_site": "https://www.jdate.com/en-de"
        }
        """.data(using: .utf8)
        
        delay(data, callback: callback)
    }
    
    static func user(with id: String, callback: @escaping (Data?, Error?) -> Void) {
        var data: Data?
        if id == "074b25e9-4ea6-413c-955e-d8e1e4d82778" {
            data = """
            {
                "user_id": "074b25e9-4ea6-413c-955e-d8e1e4d82778",
                "age": 28,
                "gender": "FEMALE",
                "like_them": true,
                "like_eachother": true,
                "match_percent": 56,
                "location": "u1mgq2x6j7pg:Diepholz,_Germany",
                "attributes": {},
                "images": [],
                "display_name": "Chii",
                "existing_conversation": "90366540",
                "last_online": "2020-06-16T13:27:19.318677Z",
                "context": "A"
            }
            """.data(using: .utf8)
        }
        
        if id == "567be1fb-7587-46f5-89ee-a78f5becdef4" {
            data = """
                    {
                        "user_id": "567be1fb-7587-46f5-89ee-a78f5becdef4",
                        "age": 37,
                        "gender": "FEMALE",
                        "like_them": true,
                        "winked": true,
                        "match_percent": 99,
                        "location": "u1x0utukyrk9:Hamburg,_Germany",
                        "attributes": {},
                        "images": [
                            {
                                "cropped": "https://www.jdate.com/profile/image/c2129c43-66ac-4585-9924-ef72ef46ca63/f1659a9cfe70ef0c1a3f63705f956852268f34f995dc02e28774b444af561a8f?1596040553",
                                "full": "https://www.jdate.com/profile/image/c2129c43-66ac-4585-9924-ef72ef46ca63/f1659a9cfe70ef0c1a3f63705f956852268f34f995dc02e28774b444af561a8f?1596040553"
                            }
                        ],
                        "display_name": "Olga",
                        "existing_conversation": "94661740",
                        "last_online": "2020-07-29T20:50:19.659725Z",
                        "context": "A"
                    }
            """.data(using: .utf8)!
        }
        
        delay(data, callback: callback)
    }
    
    static func languages(callback: @escaping (Data?, Error?) -> Void) {
        let data = """
        {
            "de": "Deutsch",
            "en": "English",
            "es": "español",
            "fr": "français",
            "he": "עברית"
        }
        """.data(using: .utf8)
        
        delay(data, callback: callback)
    }

    static func conversations(callback: @escaping (Data?, Error?) -> Void) {
        let data = """
        [
            {
                "conversation_id": "94661740",
                "with_id": "567be1fb-7587-46f5-89ee-a78f5becdef4",
                "last_message": {
                    "conversation_id": "94661740",
                    "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                    "message_type": "IMAGE",
                    "sent_at": "2020-08-03T15:34:38.463733Z",
                    "message": "57e45436-9f18-49e9-a5ae-a4d139faab5"
                }
            },
            {
                "conversation_id": "90366540",
                "with_id": "074b25e9-4ea6-413c-955e-d8e1e4d82778",
                "last_message": {
                    "conversation_id": "90366540",
                    "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                    "message_type": "MUTUAL_LIKE",
                    "sent_at": "2020-07-29T22:04:42.934234Z"
                }
            }
        ]
        """.data(using: .utf8)
        
        delay(data, callback: callback)
    }
    
    static func messages(callback: @escaping (Data?, Error?) -> Void) {
        let data = """
                [
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "WINK",
                        "sent_at": "2020-07-29T20:51:01.757258Z"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "567be1fb-7587-46f5-89ee-a78f5becdef4",
                        "message_type": "MESSAGE",
                        "sent_at": "2020-07-29T20:52:00.443630Z",
                        "message": "Hshs"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-07-29T20:52:27.924040Z",
                        "message": "6ca6be3c-3da2-47bc-878c-d78d74a77438"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-07-29T20:52:30.092156Z",
                        "message": "c527c7c2-e998-4055-8db3-e9e44dd7a9f3"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "MESSAGE",
                        "sent_at": "2020-07-30T14:37:51.284151Z",
                        "message": "Hello"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "MESSAGE",
                        "sent_at": "2020-07-30T14:38:08.476294Z",
                        "message": "What’s up"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "MESSAGE",
                        "sent_at": "2020-07-30T14:38:25.114448Z",
                        "message": "Fina"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-07-31T15:07:44.175152Z",
                        "message": "b571f13e-c4ee-46b4-9fb0-b856487ea6e0"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-07-31T15:44:54.983323Z",
                        "message": "09f9b7a8-8236-4921-8485-24c5b45ca05f"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-07-31T15:44:56.056739Z",
                        "message": "53d1efd3-89ad-4f13-b5ba-899f21584f9e"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-08-03T15:29:59.187905Z",
                        "message": "afb9be9b-53ed-4fac-9045-2e01ea54fbb8"
                    },
                    {
                        "conversation_id": "94661740",
                        "sent_by": "d2d80ecf-5515-4460-a88a-7236ffc30ae8",
                        "message_type": "IMAGE",
                        "sent_at": "2020-08-03T15:34:38.463733Z",
                        "message": "57e45436-9f18-49e9-a5ae-a4d139faab5e"
                    }
                ]
        """.data(using: .utf8)
        
        delay(data, callback: callback)
    }
}
