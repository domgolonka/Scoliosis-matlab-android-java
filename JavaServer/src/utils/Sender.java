package utils;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class Sender {
	
	private Socket socket;

	private int data;
	private String ipAddress;
	private int port;
	
	/**
	 * Constructor
	 * @param ipAddress client ip address
	 * @param port client port number
	 */
	public Sender(String ipAddress, int port) {
		this.ipAddress = ipAddress;
		this.port = port;
	}
	
	/**
	 * initialize socket
	 * @param data the data which should be sent.
	 * @throws UnknownHostException
	 * @throws IOException
	 */
	public void init(int data) throws UnknownHostException, IOException {
		if (socket == null) {
			socket = new Socket(ipAddress, port);
		}
		this.data = data;
	}
	
	/**
	 * run sending
	 */
	public void run() {
		try {
			DataOutputStream stream = new DataOutputStream(socket.getOutputStream());
			stream.writeInt(data);
			stream.flush();
			System.out.println("command " + data + " sent.");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			socket = null;
		}
	}
}
