CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"email" varchar(50) NOT NULL UNIQUE,
	"passwordHash" varchar(25) NOT NULL UNIQUE,
	"occasion_id" int NOT NULL,
	"first_name" varchar(25) NOT NULL UNIQUE,
	"last_name" varchar(50) NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Recipe" (
	"recipe_id" serial NOT NULL,
	"recipe title" varchar(50) NOT NULL UNIQUE,
	"ingredients text" varchar(1000) NOT NULL UNIQUE,
	"review_id" int NOT NULL,
	"ingredients_id" int NOT NULL,
	"users_id" int NOT NULL,
	CONSTRAINT "Recipe_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients" (
	"ingredients_id" serial NOT NULL,
	"ingredients title" varchar(50) NOT NULL UNIQUE,
	"recipe_id" int NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredients_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occasions" (
	"occasion_id" serial NOT NULL,
	"occasion title" varchar(50) NOT NULL UNIQUE,
	"recipe_id" int NOT NULL UNIQUE,
	"allergies" varchar(1000) NOT NULL UNIQUE,
	CONSTRAINT "Occasions_pk" PRIMARY KEY ("occasion_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Reviews" (
	"review_id" serial NOT NULL,
	"rating" int(5) NOT NULL UNIQUE,
	"recipe_id" int NOT NULL,
	"user_id" int NOT NULL,
	CONSTRAINT "Reviews_pk" PRIMARY KEY ("review_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Nutrition Facts" (
	"nutrition_facts_id" serial NOT NULL,
	"ingredients_id" int NOT NULL,
	"recipe_id" int NOT NULL,
	"nutrition text" varchar(1000) NOT NULL UNIQUE,
	"occasions_id" int NOT NULL,
	CONSTRAINT "Nutrition Facts_pk" PRIMARY KEY ("nutrition_facts_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Users" ADD CONSTRAINT "Users_fk0" FOREIGN KEY ("occasion_id") REFERENCES "Occasions"("occasion_id");

ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk0" FOREIGN KEY ("review_id") REFERENCES "Users"("user_id");
ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk1" FOREIGN KEY ("ingredients_id") REFERENCES "Ingredients"("ingredients_id");
ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk2" FOREIGN KEY ("users_id") REFERENCES "Users"("user_id");

ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");

ALTER TABLE "Occasions" ADD CONSTRAINT "Occasions_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");

ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");
ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_fk1" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Nutrition Facts" ADD CONSTRAINT "Nutrition Facts_fk0" FOREIGN KEY ("ingredients_id") REFERENCES "Ingredients"("ingredients_id");
ALTER TABLE "Nutrition Facts" ADD CONSTRAINT "Nutrition Facts_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");
ALTER TABLE "Nutrition Facts" ADD CONSTRAINT "Nutrition Facts_fk2" FOREIGN KEY ("occasions_id") REFERENCES "Occasions"("occasion_id");







