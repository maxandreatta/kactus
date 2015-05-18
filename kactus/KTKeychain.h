//
//  Keychain.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 18/05/15.
//  Copyright (c) 2015 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTKeychain : NSObject
{
    NSString * service;
    NSString * group;
}

/**
 *  Metodo di inizializzazione della classe per gestire il salvataggio delle informazione nel "KeyChain"
 *
 *  @param service_ Nome del servizio (ed.SERVIZIO_TEST)
 *  @param group_   Nome del gruppo per la condivisione dei dati tra applicazioni (es.YOUR_APP_ID.com.apps.shared), per tale funzione si deve abilitare la "CAPABILITIES" -> "KEYCHAIN SHARING" definendo lo stesso gruppo
 *
 *  @return Viene ritornata l'istanza
 */
-(id) initWithService:(NSString *) service_ withGroup:(NSString*)group_;

/**
 *  Metodo per inserire la chiave
 *
 *  @param key  Nome della chiave
 *  @param data Valore da salvare
 *
 *  @return Viene ritornato un BOOL se il salvataggio è andato a buon fine
 */
-(BOOL) insert:(NSString *)key : (NSData *)data;

/**
 *  Metodo per aggiornare la chiave
 *
 *  @param key  Nome della chiave
 *  @param data Valore da salvare
 *
 *  @return Viene ritornato un BOOL se l'aggiornamento è andato a buon fine
 */
-(BOOL) update:(NSString*)key :(NSData*) data;

/**
 *  Metodo per rimuovere la chiave
 *
 *  @param key  Nome della chiave
 *  @param data Valore da salvare
 *
 *  @return Viene ritornato un BOOL se la rimozione è andata a buon fine
 */
-(BOOL) remove: (NSString*)key;

/**
 *  Metodo per ricercare la chiave
 *
 *  @param key Chiave da ricercare
 *
 *  @return Viene ritornato il valore sottoforma di NSData
 */
-(NSData*) find:(NSString*)key;

@end
