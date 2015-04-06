package main;

import java.io.IOException;

public interface Supporter {
	/**
	 * dummy receiver, just for server checking on client side;
	 * @throws IOException 
	 */
	public void findClient() throws IOException;
	
	/**
	 * send command to client
	 * @param data Command founds in utils.Commands
	 * @throws Exception
	 */
	public void send(int data) throws Exception;
	
	/**
	 * get client address
	 * @return address string in format <ip address>:<port number>
	 * @throws IOException
	 */
	public String receiveClientAddress() throws IOException;
		
	/**
	 * receive picture from client
	 * @throws IOException
	 */
	public void receivePicture() throws IOException;

	/**
	 * adapt byte picture data to RGB
	 */
	public void adaptByteToRGB();

	/**
	 * @return
	 */
	public int[] getR();

	/**
	 * @return
	 */
	public int[] getG();

	/**
	 * @return
	 */
	public int[] getB();

	/**
	 * @return
	 */
	public int getClientPort();
	
	/**
	 * @return
	 */
	public String getClientIpAddress();
	
	/**
	 * @return
	 */
	public byte[] getData();
	
}