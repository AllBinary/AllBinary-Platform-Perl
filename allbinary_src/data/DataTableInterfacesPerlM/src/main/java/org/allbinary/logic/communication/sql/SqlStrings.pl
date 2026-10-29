# Generated Code Do Not Modify

package org::allbinary::logic::communication::sql::SqlStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::sql::SqlStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{CREATE_DATABASE} = "CREATE DATABASE ";
    $self->{DROP_TABLE} = "DROP TABLE ";
    $self->{CREATE_TABLE} = "CREATE TABLE ";
    $self->{START} = " (";
    $self->{SELECT} = "SELECT ";
    $self->{FROM} = " FROM ";
    $self->{SELECT_ALL} = "SELECT *";
    $self->{WHERE} = " WHERE ";
    $self->{AND} = " AND ";
    $self->{UPDATE} = "UPDATE ";
    $self->{SET} = " SET ";
    $self->{SELECT_ALL_FROM} = $self->{SELECT_ALL} . $self->{FROM};
    $self->{DELETE} = "DELETE";
    $self->{LIKE_QUOTE} = " LIKE \"";
    $self->{INSERT_INTO} = "INSERT INTO ";
    $self->{VALUES} = " VALUES ('";
    $self->{ORDER_BY} = "ORDER BY";
    $self->{COUNT} = "COUNT(";
    $self->{ASC} = "ASC";
    $self->{DESC} = "DESC";
    $self->{PRIMARY_KEY} = "PRIMARY KEY(";
    $self->{END} = ") )";
    $self->{EQUAL_QUOTE} = " = \"";
    $self->{CLOSE_QUOTE} = 'org::allbinary::string::CommonSeps'->getInstance()->{QUOTE};
    $self->{EQUAL_QUOTE_NO_SPACE} = "=\"";
    $self->{ESCAPE} = "\\";
    $self->{DOUBLE_ESCAPE} = "\\\\";
    $self->{MORE_THAN_QUOTE} = " > \"";
    $self->{LESS_THAN_QUOTE} = " < \"";
    $self->{SINGLE_QUOTE_COMMA_SEP} = "','";
    $self->{ID} = "ID";
    $self->{SQL_STATEMENT_LABEL} = "SQL Statement: ";
    $self->{COLUMN_VALUE} = "\nColumn Value: ";
    $self->{CREATE_RETURN} = " Created Successfully";
    $self->{FIELD_VALUE} = "\nField Value: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::sql::SqlStrings::instance;
}

use org::allbinary::string::CommonSeps;

1;

