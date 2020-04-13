package Adapter_Pattern.Ex2;

//
public class FormatAdapter implements MediaPlayer {
	private MediaPackage media;
	
	public FormatAdapter(MediaPackage m) {
		media = m;
	}
	
	@Override
	public void play(String filename) {
		System.out.print("Using Adapter --> ");
		media.playFile(filename);
	}

}
