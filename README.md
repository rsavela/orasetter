

Have you ever managed multiple Oracle RDBMS instances on a single
server?  Perhaps a few dozen?  You probably find yourself typing
export `ORACLE_HOME=/u01/app/oracle; ORACLE_SID=DEV2;
$ORACLE_HOME/sqlplus` a few hundred times a day.  Or you forget, or you
make a typo.  Certainly annoying.

Since I am a lazy typist, I often define aliases or bash functions to
save time.  But this requires creating a new alias for each database
instance, which in my case would require doing so thousands of
times. Hence, the inspiration of "orasetter."  Since the correct path
to the `ORACLE_HOME` is already defined for each SID in the `/etc/oratab`,
it is possible to automate the creation of these aliases.

Orasetter works by parsing the `/etc/oratab` file, and then defining a
BASH function for each database instance defined there.  The function
automatically sets the correct `ORACLE_HOME`, correct `ORACLE_SID`, and
correct `LD_LIBRARY_PATH`.  Nice.

As these functions are defined each time a login shell is invoked, it
also has the added feature of self-configuring for each new database
instance that is created.

Setup

The script is hosted on github here.  Either git clone <git url>, or
copy and paste the text into a file.

Add this line to your `~/.bashrc`, and log back in.  That's it.

Usage

Just type `sqlplus_`  and hit the tab key.  You should see the
functions defined for each database in the `/etc/oratab`.  Type the
first few letters of the one you want, hit <TAB> and <ENTER>.

Hope this is helpful to someone.  Please feel free to send me
suggestions or ideas for improvement.  I will probably add support for
auto-detecting and using `rlwrap` if it is present.
