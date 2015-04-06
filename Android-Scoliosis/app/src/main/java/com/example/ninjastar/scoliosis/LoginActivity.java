package com.example.ninjastar.scoliosis;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.text.format.Formatter;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.ninjastar.scoliosis.utils.Commands;
import com.example.ninjastar.scoliosis.utils.SocketReceiver;
import com.example.ninjastar.scoliosis.utils.SocketSender;

import java.io.IOException;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.util.concurrent.ExecutionException;

/**
 * Created by domz on 02/04/15.
 */


public class LoginActivity extends Activity {

    private String _ipAddress;
    private int _port;

    private final int CLIENT_PORT = 8888;

    private Button _buttonLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_loginscreen);

        _buttonLogin = (Button) findViewById(R.id.button_login);
        _buttonLogin.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View arg0) {
                try {
                    couple();
                } catch (Exception e) {
                    Log.d("LogInServer", e.getMessage());
                }
            }

        });
    }

    private void couple() throws InterruptedException,
            ExecutionException,
            IOException {

        if (!checkWiFi()) {
            alert("Please connect to wifi.");
            return;
        }


        TextView textView_ipAddress =
                (TextView) findViewById(R.id.editText_ipAddress);
        TextView textView_portNumber =
                (TextView) findViewById(R.id.editText_portNumber);

        String sIpAddress = textView_ipAddress.getText().toString();
        String sPort = textView_portNumber.getText().toString();

        if (sIpAddress.isEmpty()) {
            alert("Empty IP address is not allowed.");
            return;
        } else if (sPort.isEmpty()) {
            alert("Empty port number is not allowed.");
            return;
        }

        int nPort = Integer.parseInt(sPort);

        if (!checkServer(sIpAddress, nPort)) {
            alert("server not available.");
            return;
        }

        _ipAddress = sIpAddress;
        _port = Integer.parseInt(sPort);

        sendIPAddress();
        login();
    }

    private boolean checkWiFi() {
        ConnectivityManager connMgr =
                (ConnectivityManager) this.getSystemService(Context.CONNECTIVITY_SERVICE);

        final NetworkInfo wifi = connMgr.getNetworkInfo(ConnectivityManager.TYPE_WIFI);

        return wifi.isAvailable();
    }

    private boolean checkServer(String sIpAddress, int nPort)
            throws InterruptedException, ExecutionException {

        return new SocketSender(sIpAddress, nPort,
                ByteBuffer.allocate(4).putInt(Commands.TEST_CONNECTION).array())
                .execute(true).get();
    }

    private void sendIPAddress() throws UnknownHostException, SocketException {

        String address = getIPAddress();
        if (address == null) {
            new Exception("address is null.");
        }

        new SocketSender(_ipAddress, _port,
                address.getBytes()).execute(false);
    }

    private void login() throws InterruptedException,
            ExecutionException, IOException {

        int command = new SocketReceiver(CLIENT_PORT).execute().get();

        if (command == Commands.LOGIN) {
            startMonitor();
        }
    }

    @SuppressWarnings("deprecation")
    private String getIPAddress() throws UnknownHostException, SocketException {

        String clientIpAddress = null;

        WifiManager wifiMgr = (WifiManager) this.getSystemService(WIFI_SERVICE);
        WifiInfo wifiInfo = wifiMgr.getConnectionInfo();

        clientIpAddress = Formatter.formatIpAddress(wifiInfo.getIpAddress());

        if (clientIpAddress != null) {
            return clientIpAddress + ":" + CLIENT_PORT;
        } else {
            return null;
        }
    }

    private void alert(String text) {
        AlertDialog ad = new AlertDialog.Builder(this).create();
        ad.setCancelable(true);
        ad.setMessage(text);
        ad.show();
    }

    private void startMonitor() {
        if (_ipAddress.isEmpty()) {
            return;
        }

        Intent intent = new Intent(this, MonitorActivity.class);
        intent.putExtra("ipAddress", _ipAddress);
        intent.putExtra("port", _port);
        intent.putExtra("CLIENT_PORT", CLIENT_PORT);
        startActivity(intent);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
