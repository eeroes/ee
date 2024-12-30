import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';
import { Audio } from 'expo-av';

export default function App() {
  const [sound, setSound] = React.useState();

  async function playSound() {
    const { sound } = await Audio.Sound.createAsync(
       require('./assets/audio.mp3') // 将您的音频文件放在 assets 文件夹中
    );
    setSound(sound);
    await sound.playAsync(); 
  }

  return (
    <View style={styles.container}>
      <Text>点击按钮播放音频</Text>
      <Button title="播放音频" onPress={playSound} />
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
});
