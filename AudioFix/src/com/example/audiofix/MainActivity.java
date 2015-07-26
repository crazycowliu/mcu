package com.example.audiofix;

import android.os.Bundle;
import android.os.McuManager;
import android.os.McuManager.Audio;
import android.os.McuSystem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.CompoundButton;
import android.widget.Spinner;
import android.widget.ToggleButton;
import android.app.Activity;
import android.content.Context;

public class MainActivity extends Activity {

	private McuControll mControll;

	ToggleButton mcuSource, mute;
	SeekBar setVolume, LR, FR, BASS, TRIPLE;
	Spinner CLASSIC, mixing;

	public byte[] value = { -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7 };

	public byte[] classis = { McuSystem.AUDIO_EQ_CLASSIC,
			McuSystem.AUDIO_EQ_JAZZ, McuSystem.AUDIO_EQ_POP,
			McuSystem.AUDIO_EQ_ROCK };

	public byte[] mixs = { McuSystem.AUDIO_MIXING_OFF,
			McuSystem.AUDIO_MIXING_FL, McuSystem.AUDIO_MIXING_FR,
			McuSystem.AUDIO_MIXING_FLR };

	public byte lr, fr, bass, triple, volume;

	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		mcuSource = (ToggleButton) findViewById(R.id.switchSource);
		mcuSource.setOnCheckedChangeListener(new OnCheckedChangeListener() {
			public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
				mControll.switchAudioSource(arg1 ? McuSystem._SoundArm
						: McuSystem._SoundRadio);
			}
		});
		mixing = (Spinner) findViewById(R.id.mixing);
		mixing.setOnItemSelectedListener(new OnItemSelectedListener() {
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int position, long arg3) {
				mControll.setMixing(mixs[position]);
			}

			public void onNothingSelected(AdapterView<?> arg0) {
			}
		});
		mute = (ToggleButton) findViewById(R.id.mute);
		mute.setOnCheckedChangeListener(new OnCheckedChangeListener() {
			public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
				mControll.mute(arg1);
			}
		});
		setVolume = (SeekBar) findViewById(R.id.setvolume);
		setVolume.setMax(40);
		setVolume.setOnSeekBarChangeListener(sl);
		LR = (SeekBar) findViewById(R.id.lr);
		LR.setMax(15);
		LR.setOnSeekBarChangeListener(sl);
		FR = (SeekBar) findViewById(R.id.fr);
		FR.setMax(15);
		FR.setOnSeekBarChangeListener(sl);
		BASS = (SeekBar) findViewById(R.id.setbass);
		BASS.setMax(15);
		BASS.setOnSeekBarChangeListener(sl);
		TRIPLE = (SeekBar) findViewById(R.id.settriple);
		TRIPLE.setMax(15);
		TRIPLE.setOnSeekBarChangeListener(sl);

		CLASSIC = (Spinner) findViewById(R.id.spinner1);
		CLASSIC.setOnItemSelectedListener(new OnItemSelectedListener() {
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int position, long arg3) {
				mControll.setEQ(classis[position]);
			}

			public void onNothingSelected(AdapterView<?> arg0) {

			}
		});
		mControll = new AudioSystem(this);
	}

	public SeekBar.OnSeekBarChangeListener sl = new OnSeekBarChangeListener() {
		@Override
		public void onStopTrackingTouch(SeekBar arg0) {

		}

		@Override
		public void onStartTrackingTouch(SeekBar sb) {

		}

		@Override
		public void onProgressChanged(SeekBar v, int position, boolean arg2) {
			switch (v.getId()) {
			case R.id.setvolume:
				mControll.setVolume((byte) position);
				break;
			case R.id.lr:
				lr = value[position];
				mControll.setBalanace(lr, fr);
				break;
			case R.id.fr:
				fr = value[position];
				mControll.setBalanace(lr, fr);
				break;
			case R.id.setbass:
				bass = value[position];
				mControll.setBassTriple(bass, triple);
				break;
			case R.id.settriple:
				triple = value[position];
				mControll.setBassTriple(bass, triple);
				break;
			}
		}
	};

	private class AudioSystem implements McuControll {
		private McuManager mMcuManager;
		private Audio mAudio;

		public AudioSystem(Context context) {
			mMcuManager = new McuManager(context);
			mAudio = mMcuManager.getAudio();
		}

		@Override
		public void switchAudioSource(byte source) {
			mAudio.switchSource(source);
		}

		@Override
		public void setMixing(byte mode) {
			mAudio.setMixing(mode);
		}

		@Override
		public void setVolume(byte volume) {
			mAudio.setVolume(volume);
		}

		@Override
		public void setBalanace(byte balanceLR, byte balanceFR) {
			mAudio.setBalanace(balanceLR, balanceFR);
		}

		@Override
		public void setBassTriple(byte bass, byte triple) {
			mAudio.setBalanace(bass, triple);
		}

		@Override
		public void setEQ(byte eq) {
			mAudio.setEQ(eq);
		}

		@Override
		public void mute(boolean on) {
			mAudio.mute(on);
		}

		@Override
		public void query(byte target) {

		}
	}
}
