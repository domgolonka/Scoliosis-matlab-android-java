package com.example.ninjastar.scoliosis.utils;

/**
 * Created by domz on 02/04/15.
 */
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;

import android.os.AsyncTask;
import android.util.Log;

public class SocketSender extends AsyncTask<Boolean, Void, Boolean> {
    private byte[] _data;
    private String _host;
    private int _port;

    public SocketSender (String host, int port, byte[] data) {
        this._data = data;
        this._host = host;
        this._port = port;
    }

    public SocketSender (String host, int port, int data) {
        this._host = host;
        this._port = port;
        this._data = ByteBuffer.allocate(4).putInt(data).array();
    }

    private void sendData() {
        if (_data == null) {
            return;
        }

        Socket socket = null;
        DataOutputStream outputStream = null;
        try {
            socket = new Socket(_host, _port);
            outputStream = new DataOutputStream(socket.getOutputStream());
            outputStream.writeInt(_data.length);
            outputStream.write(_data);
            outputStream.flush();
        } catch (UnknownHostException e) {
            Log.d("SocketSender", "UnknownHostException: " + e.getMessage());
        } catch (IOException e) {
            Log.d("SocketSender", "IOException: " + e.getMessage());
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    Log.d("SocketSender",
                            "IOException in closing stream: " + e.getMessage());
                }
            }
            if (socket != null) {
                try {
                    socket.close();
                } catch (IOException e) {
                    Log.d("SocketSender",
                            "IOException in closing socket: " + e.getMessage());
                }
            }

        }
    }


    private void checkServer() throws UnknownHostException, IOException {
        Socket socket = new Socket(_host, _port);
        socket.close();
    }

    @Override
    protected Boolean doInBackground(Boolean... arg0) {

        boolean result = false;

        if (!arg0[0]) {
            sendData();
            result = true;
        } else {
            try {
                checkServer();
                result = true;
            } catch (UnknownHostException e) {
                result = false;
            } catch (IOException e) {
                result = false;
            }
        }

        return result;
    }

}
