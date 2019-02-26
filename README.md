# Enigma

- Turing School of Software & Design project to build an encryption algorithm based on the Caesar Cipher that can encrypt and decrypt messages.
- Details on the alogrithm can be found [here](http://backend.turing.io/module1/projects/enigma/encryption)

## How to use in command line:

### Encryption/Decryption interface
```ruby
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
```

### Cracking Interface
```ruby
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
Created 'cracked.txt' with the cracked key 82648 and date 240818
```

### Self-assessment based on [evaluation rubric] (http://backend.turing.io/module1/projects/enigma/rubric)
- Functionality: 4
- Object Oriented Programming: 3
- Test Driven Development: 4
- Version Control: 4
