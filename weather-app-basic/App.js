import React, {Component} from 'react';
import { StyleSheet, Text, View, ActivityIndicator, StatusBar } from 'react-native';
import Weather from './Weather';
import {Ionicons} from '@expo/vector-icons';

const API_KEY = "d65e839d866d98dc79d430b34816b560";

export default class App extends Component {
  state ={
    isLoaded: false,
    error: null,
    temperature: null,
    name: null
  };
  componentDidMount(){
    navigator.geolocation.getCurrentPosition(
      position => {
          this._getWeather(position.coords.latitude, position.coords.longitude);
      },
      error => {
        this.setState({
          error: error
        })
      }
    );
  }
  _getWeather=(lat, long) => {
    fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&APPID=${API_KEY}`)
    .then(response => response.json())
    .then(json => {
      this.setState({
        temperature:json.main.temp,
        name:json.weather[0].main,
        isLoaded: true
      });
    });
  };
  render() {
    const {isLoaded, error, temperature, name} = this.state;
    return (
      <View style={styles.container}>
      <StatusBar hidden = {true}/>
      {isLoaded? (
        <Weather weatherName={name} temp = {Math.ceil(temperature - 273.15)}/>
      ) : (
        <View style={styles.loading}>
          <View style={styles.icon}>
            <Ionicons color = "white" size = {144} name = "ios-cloud-download-outline" />
          </View>
        <Text style={styles.loadingText}>Getting the weather data</Text>
        {error ? <Text style={styles.errorText}>{error}</Text> : null }
        </View>
      )}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff"
  },
  loading: {
    flex: 1,
    backgroundColor: "#FDF6AA",
    justifyContent: "flex-end",
    paddingLeft: 25
  },
  loadingText:{
    fontSize : 30,
    marginBottom: 24
  },
  icon: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "transparent"
  },
  errorText: {
    color: "red",
    backgroundColor: "transparent",
    marginBottom: 40
  }
});
