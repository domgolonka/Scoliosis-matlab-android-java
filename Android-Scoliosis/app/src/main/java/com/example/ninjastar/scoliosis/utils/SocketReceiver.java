package com.example.ninjastar.scoliosis.utils;

/**
 * Created by domz on 02/04/15.
 */

import java.io.DataInputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;

import android.os.AsyncTask;
import android.util.Log;

public class SocketReceiver extends AsyncTask<Void, Void, Integer> {

    private ServerSocket _server;

    public SocketReceiver(int port) throws IOException {
        _server = new ServerSocket();
        _server.setReuseAddress(true);
        _server.bind(new InetSocketAddress(port));
    }


    @SuppressWarnings("finally")
    private int receiveData() {

        Socket socket = null;
        DataInputStream stream = null;
        int command = 0;

        try {
            socket = _server.accept();
            stream = new DataInputStream(socket.getInputStream());
            command = stream.readInt();
        } catch (IOException e) {
            Log.d("SocketReceiver", "fail to receive data: " + e.getMessage());
        } finally {

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

            return command;
        }
    }

    @Override
    protected Integer doInBackground(Void... arg0) {

        return receiveData();
    }

}
