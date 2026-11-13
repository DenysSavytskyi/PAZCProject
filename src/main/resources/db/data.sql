-- CipherTrainer demo data. Runs after schema.sql (docker-entrypoint-initdb.d).
-- Demo logins:  admin / admin123  (administrator)   demo / demo123  (regular user)
-- Password format: saltHex:hashHex  (PBKDF2WithHmacSHA256, 65536 iterations, 256-bit key)

INSERT INTO "user" (id, username, password_hash, total_score, created_at, is_admin) VALUES
  (1, 'admin', '69a3f72932102ae2b6c80e6f8b8adbd3:a7c3cd0e850d0cace11eb20d3e1121f588566de57e263a5642ef029011524cbc', 0, now() - interval '30 days', true),
  (2, 'demo',  'f28bc9ee48f3eb93606fee8243e079e0:a2ef084e1ee7456ee436dd6d8f68bc0ca6f6c48330a6cd329704a0fb6ef08a4d', 100, now() - interval '7 days', false);

INSERT INTO algorithm (id, name, type) VALUES
  (1, 'Caesar Cipher', 'SUBSTITUTION'),
  (2, 'Atbash Cipher', 'SUBSTITUTION'),
  (3, 'Vigenère Cipher', 'SUBSTITUTION'),
  (4, 'Rail Fence Cipher', 'TRANSPOSITION'),
  (5, 'Columnar Transposition', 'TRANSPOSITION'),
  (6, 'XOR Stream Cipher', 'STREAM'),
  (7, 'RC4 Stream Cipher', 'STREAM');

INSERT INTO lesson (id, algorithm_id, title, content_text) VALUES
  (1, 1, 'Caesar: How it works', $$The Caesar cipher is one of the oldest known ciphers. Julius Caesar reportedly used it to protect military messages.

HOW IT WORKS
Pick a number called the shift (this is the key), for example 3. Replace every letter by the letter that is 3 positions further in the alphabet. After Z the alphabet wraps around to A. Spaces and punctuation are left unchanged.

EXAMPLE (shift 3)
Plain:  HELLO
Cipher: KHOOR

HOW TO DECRYPT
Move every letter back by the same number of positions. If you do not know the shift, continue with the next lesson.$$),
  (2, 1, 'Caesar: Breaking the cipher', $$The Caesar cipher is very weak because there are only 25 useful shifts.

BRUTE FORCE
Try every shift from 1 to 25 and read the results. Exactly one of them looks like real text.

FREQUENCY ANALYSIS
In English the most common letter is E. If the most common letter of the ciphertext is, for example, P, then E was probably moved to P, so the shift is 11 (E -> P).

ROT13
ROT13 is a Caesar cipher with shift 13. Because the alphabet has 26 letters, applying ROT13 twice gives back the original text.$$),
  (3, 2, 'Atbash: The mirror alphabet', $$Atbash is a substitution cipher that reverses the alphabet: A <-> Z, B <-> Y, C <-> X and so on. It was originally used for the Hebrew alphabet.

EXAMPLE
Plain:  HELLO
Cipher: SVOOL

There is no key, so the cipher offers no real security. Encryption and decryption are the same operation: applying Atbash twice returns the original text.

TIP
Write the alphabet and its reverse below it, then look every letter up.$$),
  (4, 3, 'Vigenère: The repeating key', $$The Vigenere cipher uses a keyword instead of a single shift, so one plaintext letter can become different ciphertext letters.

HOW IT WORKS
Write the key repeatedly under the message. Each key letter tells you how far to shift the letter above it (A = 0, B = 1, C = 2 ...). Spaces are skipped and the key does not advance on them.

EXAMPLE (key LEMON)
Plain:  ATTACK
Key:    LEMONL
Cipher: LXFOPV

HOW TO DECRYPT
Shift every letter backwards by the value of its key letter.

HOW TO BREAK IT
First find the key length (Kasiski examination or the index of coincidence). After that every n-th letter was shifted by the same amount, so each position is just a Caesar cipher.$$),
  (5, 4, 'Rail Fence: Zigzag writing', $$The rail fence cipher is a transposition cipher: letters are not replaced, only moved to new positions.

HOW IT WORKS
Write the message diagonally in a zigzag over N rails (rows), then read the rails one by one from top to bottom.

EXAMPLE (3 rails)
Plain: HELLOWORLD

H . . . O . . . L .
. E . L . W . R . D
. . L . . . O . . .

Rail 1: HOL   Rail 2: ELWRD   Rail 3: LO
Cipher: HOLELWRDLO

HOW TO DECRYPT
Work out how many letters each rail gets, cut the ciphertext into rails and read the zigzag again.$$),
  (6, 5, 'Columnar: Reading by columns', $$The columnar transposition cipher uses a keyword to decide in which order columns are read.

HOW IT WORKS
1. Write the message in rows under the key letters.
2. Number the key letters alphabetically (ties from left to right).
3. Read the columns in that order.

EXAMPLE (key ZEBRAS, message COME TO THE OLD HARBOR AT NOON)
Z E B R A S
C O M E T O
T H E O L D
H A R B O R
A T N O O N
(The message has exactly 24 letters, so no padding is needed.)

The alphabetical order of the key letters is A (column 5), B (column 3), E (column 2), R (column 4), S (column 6), Z (column 1). Read column 5 first, then column 3, and so on.
Cipher: TLOOMERNOHATEOBOODRNCTHA

HOW TO DECRYPT
Divide the ciphertext into equal blocks (one block per column), put the blocks back into the key order and read the rows.$$),
  (7, 6, 'XOR streams: The basics', $$A stream cipher combines the plaintext with a keystream byte by byte, usually using XOR.

XOR RULE
0 xor 0 = 0, 1 xor 1 = 0, 0 xor 1 = 1, 1 xor 0 = 1.
XOR is its own inverse: (P xor K) xor K = P, so encryption and decryption are the same operation.

EXAMPLE
The letter H is 0x48. With the key byte 0x5A: 0x48 xor 0x5A = 0x12.

REPEATING KEY
If the key is shorter than the message, it is repeated: key KEY gives K, E, Y, K, E, Y ...

WARNING
Never reuse the same keystream for two messages: XOR of the two ciphertexts removes the key and leaks the plaintexts.$$);

INSERT INTO challenge (id, algorithm_id, cipher_text, plain_text, difficulty_level, reward_points) VALUES
  (1, 1, 'KHOOR ZRUOG', 'HELLO WORLD', 1, 50),
  (2, 1, 'HAAHJR HA KHDU', 'ATTACK AT DAWN', 2, 80),
  (3, 1, 'ESP BFTNV MCZHY QZI UFXAD ZGPC ESP WLKJ OZR', 'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG', 3, 120),
  (4, 2, 'HVXIVG NVHHZTV', 'SECRET MESSAGE', 1, 50),
  (5, 2, 'PMLDOVWTV RH KLDVI', 'KNOWLEDGE IS POWER', 2, 70),
  (6, 3, 'XIQHZ PEFHU PFDWQ RI', 'MEET ME AT THE BRIDGE', 3, 150),
  (7, 3, 'EZNWX FIZPW LPKAI OIRTB DMAIK BXUKJ GKGLX DGAHH KVU', 'CRYPTOGRAPHY IS THE ART OF WRITING SECRET MESSAGES', 4, 200),
  (8, 4, 'WECRLTEERDSOEEFEAOCAIVDEN', 'WE ARE DISCOVERED FLEE AT ONCE', 2, 90),
  (9, 4, 'TRINGHCEHDITIZEETSDNHZASIEEG', 'THE SECRET IS HIDDEN IN THE ZIGZAG', 3, 130),
  (10, 5, 'MNLAEEHEBTEEHIATIORTEDDRNMBTLY', 'MEET ME BEHIND THE OLD LIBRARY AT TEN', 4, 180),
  (11, 6, '12 1F 16 16 15 7A 09 0E 08 1F 1B 17', 'HELLO STREAM', 3, 140),
  (12, 6, '18 11 0B 0E 04 14 6B 06 10 1B 0D 1C 19 16 79 0A 17 1C 6B 03 18 18 11', 'STREAM CIPHERS ARE FAST', 4, 200),
  (13, 7, 'BBF316E8D940AF0AD3', 'Plaintext', 5, 300);

INSERT INTO hint (challenge_id, hint_text, cost_points) VALUES
  (1, 'The message is shifted forward in the alphabet by a fixed number of positions.', 5),
  (1, 'The shift is 3.', 15),
  (2, 'There are only 25 possible shifts. Try them one by one.', 5),
  (2, 'The shift is 7.', 20),
  (3, 'Use frequency analysis: the most common letter in English text is E.', 10),
  (3, 'The shift is 11.', 30),
  (4, 'Atbash maps A to Z, B to Y, C to X ... The cipher has no key.', 5),
  (5, 'Write the alphabet forwards and backwards on two lines and look up each letter.', 10),
  (6, 'This is a Vigenere cipher. The key has 5 letters.', 10),
  (6, 'The key is a citrus fruit.', 30),
  (7, 'The key has 6 letters.', 15),
  (7, 'The key is a synonym of the word code.', 40),
  (8, 'Rail fence with 3 rails. Spaces were removed before encrypting.', 10),
  (9, 'Rail fence with 4 rails.', 10),
  (9, 'Rails are read from the top rail to the bottom rail.', 20),
  (10, 'The key has 6 letters and is the plural of a striped African animal.', 20),
  (10, 'Columns were read in the alphabetical order of the key letters. The message has 30 letters.', 40),
  (11, 'Every byte was XORed with the same single byte. The ciphertext is written in hex.', 10),
  (11, 'The key byte is 5A (hex).', 40),
  (12, 'The key is 3 letters long and is repeated (KEY would be a bad key).', 20),
  (12, 'The key is the word KEY.', 60),
  (13, 'This is RC4: key scheduling (KSA) followed by the keystream generator (PRGA). The ciphertext is hex.', 30),
  (13, 'The key is the ASCII text Key (capital K).', 60);

INSERT INTO achievement (id, name, description, criteria) VALUES
  (1, 'First Solve', 'Solve your first challenge.', '{"type": "FIRST_SOLVE"}'::jsonb),
  (2, 'Speed Demon', 'Solve any challenge in 30 seconds or less.', '{"type": "FAST_SOLVE", "maxSeconds": 30}'::jsonb),
  (3, 'Getting Started', 'Solve 3 different challenges.', '{"type": "SOLVE_COUNT", "count": 3}'::jsonb),
  (4, 'Cipher Veteran', 'Solve 10 different challenges.', '{"type": "SOLVE_COUNT", "count": 10}'::jsonb),
  (5, 'Century', 'Collect 100 points.', '{"type": "TOTAL_SCORE", "score": 100}'::jsonb),
  (6, 'Transposition Master', 'Solve 2 challenges on transposition ciphers.', '{"type": "TYPE_SOLVE_COUNT", "algorithmType": "TRANSPOSITION", "count": 2}'::jsonb),
  (7, 'Hardcore', 'Solve a challenge with difficulty 5.', '{"type": "DIFFICULTY_SOLVED", "minDifficulty": 5}'::jsonb);

-- demo user history: 2 solved (100 points) and 2 unfinished attempts
INSERT INTO attempt (id, user_id, challenge_id, is_successful, time_taken_seconds, attempt_date) VALUES
  (1, 2, 1, true,  25,  now() - interval '3 days'),
  (2, 2, 2, NULL,  45,  now() - interval '2 days 3 hours'),
  (3, 2, 4, true,  40,  now() - interval '2 days'),
  (4, 2, 6, NULL, 120,  now() - interval '1 day');

INSERT INTO user_achievement (user_id, achievement_id, unlocked_at) VALUES
  (2, 1, now() - interval '3 days'),
  (2, 2, now() - interval '3 days'),
  (2, 5, now() - interval '2 days');

-- identity columns were filled with explicit ids: move the sequences forward
SELECT setval(pg_get_serial_sequence('"user"', 'id'), (SELECT MAX(id) FROM "user"));
SELECT setval(pg_get_serial_sequence('algorithm', 'id'), (SELECT MAX(id) FROM algorithm));
SELECT setval(pg_get_serial_sequence('lesson', 'id'), (SELECT MAX(id) FROM lesson));
SELECT setval(pg_get_serial_sequence('challenge', 'id'), (SELECT MAX(id) FROM challenge));
SELECT setval(pg_get_serial_sequence('achievement', 'id'), (SELECT MAX(id) FROM achievement));
SELECT setval(pg_get_serial_sequence('attempt', 'id'), (SELECT MAX(id) FROM attempt));
-- hint ids were generated automatically, no setval needed
