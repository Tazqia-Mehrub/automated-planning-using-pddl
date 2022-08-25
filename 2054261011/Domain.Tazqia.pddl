(define (domain TAZQIA)

(:requirements :typing :equality :conditional-effects)
(:types room object)
(:constants table gripper - object)

(:predicates 
(HANDEMPTY)(clear ?obj)(on ?obj ?from)(at ?room ?obj)(holding ?obj) )

(:action  pick-up
	 :parameters (?obj  ?from ?room)
	 :precondition (and 
	 (HANDEMPTY)(clear ?obj)(on ?obj ?from)(at ?room ?obj)(at ?room ?from)(at ?room gripper)(not(= ?obj table))
	 (not(= ?obj gripper))(not(= ?from gripper)))
	 
	 :effect (and
		   (not(HANDEMPTY))(holding ?obj)(not(clear ?obj))(clear ?from)(not(on ?obj ?from))
		   ))


(:action put-down
	 :parameters (?obj ?to ?room)
	 :precondition (and 
	              (holding ?obj)(at ?room ?obj)(at ?room ?to)(at ?room gripper)(clear ?to)(not(= ?to gripper)))
			    
	 :effect (and (not (holding ?obj))(clear ?obj)(handempty)(on ?obj ?to) (when (not(= ?to table))(not(CLEAR ?to))))
	 )

(:action move
	 :parameters (?obj - object ?from_room ?to_room - room)
	 :precondition (and (at ?from_room gripper)(at ?from_room ?obj)(holding ?obj))
	 :effect (and (not (at ?from_room ?obj))(not (at ?from_room gripper))
		      (at ?to_room ?obj)(at ?to_room gripper))
	)
	)