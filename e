import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';
import { Audio } from 'expo-av';

export default function App() {
  const [sound, setSound] = React.useState();
  const [isPlaying, setIsPlaying] = React.useState(false);

  async function playSound() {
    const { sound } = await Audio.Sound.createAsync(
      require('./assets/audio.mp3')  // 请确保上传音频文件到 assets 文件夹
    );
    setSound(sound);
    await sound.playAsync();
    setIsPlaying(true);
  }

  async function stopSound() {
    if (sound) {
      await sound.stopAsync();
      setIsPlaying(false);
    }
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>点击按钮播放音频</Text>
      <Button title={isPlaying ? "停止音频" : "播放音频"} onPress={isPlaying ? stopSound : playSound} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 18,
    marginBottom: 20,
  },
});
