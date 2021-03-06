package com.example.ninjastar.scoliosis.utils;

/**
 * Created by domz on 02/04/15.
 */

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;

public class SocketReceiver extends AsyncTask<Void, Void, byte[]> {

    private ServerSocket _server;
    private boolean sendpicture;

    public SocketReceiver(int port) throws IOException {
        _server = new ServerSocket();
        _server.setReuseAddress(true);
        _server.bind(new InetSocketAddress(port));
        this.sendpicture= sendpicture;
    }


    @SuppressWarnings("finally")
    private byte[] receiveData() {

        Socket socket = null;
        DataInputStream stream = null;
        byte[] data = null;
        try {
            socket = _server.accept();
            stream = new DataInputStream(socket.getInputStream());

            int s = stream.readInt();
            Log.d("Reading DATA ", String.valueOf(s));
            if (s != 101) {
                data = new byte[s];
                stream.readFully(data);

            } else {
                data = ByteBuffer.allocate(4).putInt(s).array();
                Log.d("Reading S", String.valueOf(s));
            }
        }catch(Exception e) {
            Log.d("SocketReceiver", "fail to receive data: " + e.getMessage());
            e.printStackTrace();
        }finally {

            if (stream != null) {
                try {
                    stream.close();
                } catch (IOException e) {
                    Log.d("SocketReceiver", "fail to close stream: " + e.getMessage());
                } finally {
                    stream = null;
                }
            }


            if (socket != null) {
                try {
                    socket.close();
                } catch (IOException e) {
                    Log.d("SocketReceiver", "fail to close socket: " + e.getMessage());
                } finally {
                    socket = null;
                }
            }

            if (_server != null) {
                try {
                    _server.close();
                } catch (IOException e) {
                    Log.d("SocketReceiver", "fail to close server: " + e.getMessage());
                } finally {
                    _server = null;
                }
            }

            return data;

        }
    }

    @Override
    protected byte[] doInBackground(Void... arg0) {
        byte[] recdata =  receiveData();
        return recdata;
    }


}
