package io.flutter.plugins.firebase_mlkit_language;

import androidx.annotation.NonNull;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.FirebaseApp;
import com.google.firebase.ml.common.modeldownload.FirebaseModelManager;
import com.google.firebase.ml.naturallanguage.translate.FirebaseTranslateRemoteModel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import io.flutter.plugin.common.MethodChannel;

class ViewModels implements ViewModelAgent {

    static final ViewModels instance = new ViewModels();

    private ViewModels() {
    }

    @Override
    public void handleEvent(final MethodChannel.Result result) {
        FirebaseModelManager.getInstance().getDownloadedModels(FirebaseTranslateRemoteModel.class)
                .addOnSuccessListener(new OnSuccessListener<Set<FirebaseTranslateRemoteModel>>() {
                    @Override
                    public void onSuccess(Set<FirebaseTranslateRemoteModel> models) {
                        List<String> translateModels = new ArrayList<>(models.size());
                        for (FirebaseTranslateRemoteModel model : models) {
                            translateModels.add(model.getLanguageCode());
                        }
                        result.success(translateModels);
                    }
                }).addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        result.error("viewError", e.getLocalizedMessage(), null);
                    }
                });
    }
}
