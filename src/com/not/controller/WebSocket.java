package com.not.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONException;
import org.json.JSONObject;

@ServerEndpoint("/frontend/not/{memno}")
public class WebSocket {

private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
private static final Map<String, Session> map = Collections.synchronizedMap(new HashMap<>());
	
	@OnOpen
	public void onOpen(@PathParam("memno") String memno, Session userSession) throws IOException {
		allSessions.add(userSession);
		map.put(memno, userSession);
		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(memno + ": 已連線");
	}
	
	@OnMessage
	public void onMessage(String message) {
		String memno = message;
		
		Session session = map.get(memno);
		
		if (session != null) {
			session.getAsyncRemote().sendText(message);
		}
	}
	
	@OnError
	public void onError(Session userSession, Throwable e){
//		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		allSessions.remove(userSession);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}
}