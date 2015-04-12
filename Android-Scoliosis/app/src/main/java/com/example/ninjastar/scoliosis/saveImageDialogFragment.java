package com.example.ninjastar.scoliosis;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.widget.EditText;
import android.widget.TextView;

/**
 * Created by ninjastar on 15-04-11.
 */
public class saveImageDialogFragment extends DialogFragment {

    onSaveSelectedListener mCallback;

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState){
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        // Get the layout inflater
        LayoutInflater inflater = getActivity().getLayoutInflater();

        final TextView textView = (EditText) getView().findViewById(R.id.filenameEditText);

        builder.setView(inflater.inflate(R.layout.fragment_savenamedialog, null))
                // Add action buttons
                .setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        mCallback.onSaveSelected(textView.getText().toString());
                        Log.i("saveImageDialogFragment", "entered text:" + textView.getText().toString());
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        saveImageDialogFragment.this.getDialog().cancel();
                    }
                });
        return builder.create();

    }


    public interface onSaveSelectedListener{
        public void onSaveSelected(String FILENAME);
    }

    @Override
    public void onAttach(Activity activity){
        super.onAttach(activity);

        // This makes sure that the container activity has implemented
        // the callback interface. If not, it throws an exception
        try {
            mCallback = (onSaveSelectedListener) activity;
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString()
                    + " must implement OnHeadlineSelectedListener");
        }
    }


}
