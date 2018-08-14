import React from 'react';
import { StyleSheet, Text, View, ActivityIndicator } from 'react-native';

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
        <View style = {styles.blackView} />
        <View style = {styles.redView}/>
      </View>
    );
}
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    justifyContent: 'space-around',
    alignItems: 'center',
    flexDirection: 'row'
  },
  blackView:{
    height:50,
    width:50,
    backgroundColor: 'black'
  },
  redView:{
    height:50,
    width:50,
    backgroundColor: 'red'
  }
});
