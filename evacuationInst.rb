def installTable
	#database open
        db = SQLite3::Database.new($dbdata2)
        #sql code
        sql = "delete from evacuations;"
	db.execute(sql)
	db.close

	#database open
	db = SQLite3::Database.new($dbdata)
	#sql code
	sql = "SELECT * FROM 避難所;"
	dbsize=db.execute(sql).size
	print dbsize
	$data2=Hash.new{|hash,key| hash[key] = {}}
	i=0
	a=1
	#select
	db.execute(sql) do |row|
	  $data2[i][0] = a
          $data2[i][1] = row[0]
          $data2[i][2] = row[1]
          $data2[i][3] = row[2]
          $data2[i][4] = row[3]
          $data2[i][5] = row[4]
          $data2[i][6] = row[5]
          $data2[i][7] = row[6]
          $data2[i][8] = row[7]
	  $data2[i][9] = row[8]
          $data2[i][10] = Time.now
          $data2[i][11] = Time.now
	  # the building in Evacuation table?
	  i=i+1
	  a=a+1
        end
	db.close

	#database open
        db = SQLite3::Database.new($dbdata2)
	for j in 0..dbsize-1 do
	  #sql code
	  sql = "insert into evacuations values(#{$data2[j][0]}, '#{$data2[j][1]}','#{$data2[j][2]}','#{$data2[j][3]}','#{$data2[j][4]}','#{$data2[j][5]}','#{$data2[j][6]}','#{$data2[j][7]}','#{$data2[j][8]}','#{$data2[j][9]}','#{$data2[j][10]}','#{$data2[j][11]}');"		  
	  puts sql
	  db.execute(sql)
	end
	db.close
end
