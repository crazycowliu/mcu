package com.example.audiofix;

public interface McuControll {
	/**
	 * 切换音源
	 * 
	 * @param source
	 */
	public void switchAudioSource(byte source);

	/**
	 * 设置混音
	 * 
	 * @param mode
	 */
	public void setMixing(byte mode);

	/**
	 * MCU音量设置
	 * 
	 * @param volume
	 */
	public void setVolume(byte volume);
	
	/**
	 * 设置平衡
	 * @param balanceLR
	 * @param balanceFR
	 */
	public void setBalanace(byte balanceLR,byte balanceFR);
	
	/**
	 * 设置均衡，高低音
	 * @param bass
	 * @param triple
	 */
	public void setBassTriple(byte bass,byte triple);
	
	/**
	 * 设置EQ音效
	 * @param eq
	 */
	public void setEQ(byte eq);
	
	
	/**
	 * 设置静音
	 * @param on
	 */
	public void mute(boolean on);
	
	/**
	 * 查询
	 * @param target
	 */
	public void query(byte target);
}
