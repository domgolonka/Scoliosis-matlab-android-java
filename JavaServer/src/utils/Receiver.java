package utils;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Receiver {
private static Receiver _receiver;
	
	private byte[] _data;
	private ServerSocket _server;
	private Socket _socket;
	
	
	private Receiver() {
		
	}
	
	
	/**
	 * get receiver instance
	 * @param port port number used by localhost server
	 * @return
	 * @throws IOException
	 */
	public static Receiver getInstance(int port) throws IOException {
		if (_receiver == null) {
			_receiver = new Receiver();
			_receiver.initializeServer(port);
		}
		return _receiver;
	}
	
	
	/**
	 * initialize server, this is only allowed to be invoked by getInstance
	 * @param port
	 * @throws IOException
	 */
	public void initializeServer(int port) throws IOException {
		_server = new ServerSocket(port);	
	}
	
	
	/**
	 * run the receiving
	 */
	public void run() {
		DataInputStream stream = null;
		try {
			_socket = _server.accept();
			stream = new DataInputStream(_socket.getInputStream());
			_data = new byte[stream.readInt()];
			stream.readFully(_data);
		} catch (IOException e) {
			System.out.println("IOException3" + e.getMessage());
		} finally {
			if (stream != null) {
				try {
					stream.close();
					stream = null;
				} catch (IOException e) {
					System.out.println("IOException4" + e.getMessage());
				}
			}
			
			try {
				_socket.close();
				_socket = null;
			} catch (IOException e) {
				System.out.println("IOException5" + e.getMessage());
			}
			
		}
	}
	
	
	/**
	 * get received data
	 * @return
	 */
	public byte[] getData() {
		return this._data;
	}
}
