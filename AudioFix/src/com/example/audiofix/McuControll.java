package com.example.audiofix;

public interface McuControll {
	/**
	 * �л���Դ
	 * 
	 * @param source
	 */
	public void switchAudioSource(byte source);

	/**
	 * ���û���
	 * 
	 * @param mode
	 */
	public void setMixing(byte mode);

	/**
	 * MCU��������
	 * 
	 * @param volume
	 */
	public void setVolume(byte volume);
	
	/**
	 * ����ƽ��
	 * @param balanceLR
	 * @param balanceFR
	 */
	public void setBalanace(byte balanceLR,byte balanceFR);
	
	/**
	 * ���þ��⣬�ߵ���
	 * @param bass
	 * @param triple
	 */
	public void setBassTriple(byte bass,byte triple);
	
	/**
	 * ����EQ��Ч
	 * @param eq
	 */
	public void setEQ(byte eq);
	
	
	/**
	 * ���þ���
	 * @param on
	 */
	public void mute(boolean on);
	
	/**
	 * ��ѯ
	 * @param target
	 */
	public void query(byte target);
}
