# Generated Code Do Not Modify

package org::allbinary::logic::communication::sql::SqlTypeStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::sql::SqlTypeStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{CHAR_COLUMN} = "VARCHAR";
    $self->{INT_COLUMN} = "VARCHAR";
    $self->{MAX_SIZE} = "(255)";
    $self->{SIXTY_SIZE} = "(60)";
    $self->{NOT_NULL} = "NOT NULL";
    $self->{ONE_SIZE} = "(1)";
    $self->{TWO_SIZE} = "(2)";
    $self->{THREE_SIZE} = "(3)";
    $self->{SIX_SIZE} = "(6)";
    $self->{ELEVEN_SIZE} = "(11)";
    $self->{TWELVE_SIZE} = "(12)";
    $self->{ONE_KB_CHAR_COLUMN} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append("(1024)")->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{MAX_CHAR_COLUMN} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append($self->{MAX_SIZE})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{MAX_CHAR_COLUMN_NOT_NULL} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append($self->{MAX_SIZE})->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{NOT_NULL})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{SIXTY_CHAR_COLUMN_NOT_NULL} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append($self->{SIXTY_SIZE})->append($self->{NOT_NULL})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{ONE_CHAR_COLUMN_NOT_NULL} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append($self->{ONE_SIZE})->append($self->{NOT_NULL})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{SIX_CHAR_COLUMN_NOT_NULL} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append($self->{SIX_SIZE})->append($self->{NOT_NULL})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{TWELVE_CHAR_COLUMN_NOT_NULL} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{CHAR_COLUMN})->append($self->{TWELVE_SIZE})->append($self->{NOT_NULL})->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP})->toString();
    $self->{TWO_INT_NOT_NULL} = " INT(2) NOT NULL, ";
    $self->{THREE_INT_NOT_NULL} = " INT(3) NOT NULL, ";
    $self->{FOUR_INT_NOT_NULL} = " INT(4) NOT NULL, ";
    $self->{MAX_INT_NOT_NULL} = " INT(11) NOT NULL, ";
    $self->{MAX_INT_UNSIGNED} = " INT(11) UNSIGNED, ";
    $self->{MAX_INT_UNSIGNED_NOT_NULL} = " INT(11) UNSIGNED NOT NULL, ";
    $self->{MAX_BIG_INT_NOT_NULL} = " BIGINT(19) NOT NULL, ";
    $self->{MAX_BIG_INT_UNSIGNED} = " BIGINT(19) UNSIGNED, ";
    $self->{MAX_BIG_INT_UNSIGNED_NOT_NULL} = " BIGINT(19) UNSIGNED NOT NULL, ";
    $self->{MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL} = " BIGINT(19) UNSIGNED AUTO_INCREMENT NOT NULL,";
    $self->{LONG_BLOB} = " LONGBLOB, ";
    $self->{BLOB} = " BLOB, ";
    $self->{BLOB_NOT_NULL} = " BLOB NOT NULL, ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::sql::SqlTypeStrings::instance;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

