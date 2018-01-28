/**
	THE CHINESE UNIVERSITY OF HONG KONG
	Department of Information Engineering
	Final Year Project

	E-commerce Application/Platform Development
	using Cloud-based Blockchain-as-a-Service

	by
	WAN Kam Leung
	1155068082

	Edited 10Jan2018
**/

import React, { Component } from 'react';
import { AppRegistry, View, Button } from 'react-native';

export default class AlignItemsBasics extends Component {
  render() {
    return (
      // Try setting `alignItems` to 'flex-start'
      // Try setting `justifyContent` to `flex-end`.
      // Try setting `flexDirection` to `row`.
      <View style={{
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
      }}>
        <View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'skyblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
      </View>

      
    );
  }
};

AppRegistry.registerComponent('AwesomeProject', () => AlignItemsBasics);