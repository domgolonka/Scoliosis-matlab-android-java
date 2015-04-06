package main;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.UnknownHostException;

import utils.Receiver;
import utils.Sender;

public class ServerSupport implements Supporter {
	private static ServerSupport _supp = null;
	
	private int port;
	
	private int clientPort;
	private String clientIpAddress;
	
	private byte[] data;
	
	private int[] R;
	private int[] G;
	private int[] B;
	
	/**
	 * @param port The port number used in localhost server
	 * @return
	 */
	public static Supporter getInstance(int port) {
		if (_supp != null) {
			return _supp;
		} else {
			return new ServerSupport(port);
		}
	}
	
	private ServerSupport(int port) {
		this.port = port;
		try {
			System.out.print("Start server. IP: "+ 
			           Inet4Address.getLocalHost().getHostAddress() + 
			           ", Port: " + port);
		} catch (UnknownHostException e) {
			System.out.println("..FAIL." + e.getMessage());
		}
	}
	@Override
	public void findClient() throws IOException {
		
		Receiver receiver = Receiver.getInstance(port);
		receiver.run();
		
	}
	
	@Override
	public void send(int data) throws Exception {
		if (clientIpAddress == null) {
			throw new Exception("client ipaddress is empty.");
		}
		
		Sender sender = new Sender(clientIpAddress, clientPort);
		sender.init(data);
		sender.run();
	}

	@Override
	public void receivePicture() throws IOException {
				
		Receiver receiver = Receiver.getInstance(port);
		receiver.run();
		
		this.data = receiver.getData();
	}
	
	@Override
	public String receiveClientAddress() throws IOException {
		Receiver receiver = Receiver.getInstance(port);
		receiver.run();
		
		String address = new String(receiver.getData());
		
		if (address.contains(":")) {
			clientPort = Integer.parseInt(address.substring(address.indexOf(":") + 1, 
					address.length()));
			clientIpAddress = address.substring(0, address.indexOf(":"));
		}else {
			clientIpAddress = address;
			clientPort = 0;
		}
		
		return address;
	}

	
	@Override
	public int getClientPort() {
		return clientPort;
	}

	
	@Override
	public String getClientIpAddress() {
		return clientIpAddress;
	}
	
	
	@Override
	public void adaptByteToRGB() {
		
		if (data == null || data.length == 0) {
			System.out.println("data not received. return.");
			return;
		}
		
		int[] intData = new int[data.length / 3];
		R = new int[intData.length];
		G = new int[intData.length];
		B = new int[intData.length];
		
		for (int i = 0; i < intData.length; i++) {
			R[i] = data[i*3] & 0xFF;
			G[i] = data[i*3 + 1] & 0xFF;
			B[i] = data[i*3 + 2] & 0xFF;
		}

	}

	@Override
	public int[] getR() {
		return R;
	}

	@Override
	public int[] getG() {
		return G;
	}

	@Override
	public int[] getB() {
		return B;
	}
	
	@Override
	public byte[] getData() {
		return data;
	}
	
}

