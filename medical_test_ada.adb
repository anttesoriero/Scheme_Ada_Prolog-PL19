-- Ada Medical Test
-- Anthony Tesoriero, October 21 2019, Programming Languages Fall 2019

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure Medical_Test is
	-- Variables --
	Max_Patients: constant Integer := 100;
	Num_Patients: Integer;
	type Patient_List_Type is array(1..Max_Patients, 1..4) of Integer;
	Patient_List: Patient_List_Type;
	
	T1_Counter, T2_Counter: Integer := 0;	-- # of pats pos on t1 & t2
	DT1_Counter, DT2_Counter: Integer := 0; -- # of pats pos on t1 & t2 w/ disease
	HT1_Counter, HT2_Counter: Integer := 0; -- # of pats neg on t1 & t2 w/ disease
	DPos1, DPos2, HNeg1, HNeg2: Float;	-- Probability totals
begin
	-- Body --
	Put("How many patients? ");
	Get(Num_Patients);
	Put_Line("Enter patient data (4 numbers per patient):");
	for Patient in 1..Num_Patients loop
		for Col in 1..4 loop
			Get(Patient_List(Patient, Col));
			if Col = 3 then
				T1_Counter := T1_Counter + Patient_List(Patient, Col);
			elsif Col = 4 then
				T2_Counter := T2_Counter + Patient_List(Patient, Col);
			end if;
		end loop;

		if Patient_List(Patient, 2) = 1 and Patient_List(Patient, 3) = 1 then
			DT1_Counter := DT1_Counter + 1;
		elsif Patient_List(Patient, 2) = 0 and Patient_List(Patient, 3) = 0 then
			HT1_Counter := HT1_Counter + 1;
		end if;
		
		if Patient_List(Patient, 2) = 1 and Patient_List(Patient, 4) = 1 then
			DT2_Counter := DT2_Counter + 1;
		elsif Patient_List(Patient, 2) = 0 and Patient_List(Patient, 4) = 0 then
			HT2_Counter := HT2_Counter + 1;
		end if;
	end loop;

	New_Line(1);

	Put("P(D | Pos1) = ");
	DPos1 := Float(DT1_Counter) / Float(T1_Counter);
	Put(DPos1, 0, 2, 0);
	New_Line(1);

	Put("P(D | Pos2) = ");
	DPos2 := Float(DT2_Counter) / Float(T2_Counter);
	Put(DPos2, 0, 2, 0);
	New_Line(1);

	Put("P(H | Neg1) = ");
	HNeg1 := Float(HT1_Counter) / Float((Num_Patients - T1_Counter));
	Put(HNeg1, 0, 2, 0);
	New_Line(1);

	Put("P(H | Neg2) = ");
	HNeg2 := Float(HT2_Counter) / Float((Num_Patients - T2_Counter));
	Put(HNeg2, 0, 2, 0);
	New_Line(1);

	if DPos1 > DPos2 and HNeg1 > HNeg2 then
		Put("Test 1 is better.");
	elsif DPos1 < DPos2 and HNeg1 < HNeg2 then
		Put("Test 2 is better.");
	else
		Put("Neither test is better.");
	end if;


end Medical_Test;

