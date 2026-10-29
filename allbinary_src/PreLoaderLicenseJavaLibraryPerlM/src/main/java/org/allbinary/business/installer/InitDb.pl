#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

#Warning you must have sql root access
package org::allbinary::business::installer::InitDb;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{anyType} = undef;
    $self->{METHOD_CALL_GET_HOST_NAME} = "getHostName";
    $self->{METHOD_CALL_ADD_USERS} = "addUsers";
    $self->{METHOD_CALL_ADD_DATABASES} = "addDatabases";
    $self->{METHOD_CALL_ADD_TABLES} = "addTables";
    $self->{METHOD_CALL_TEMP_MAIN_PATH} = "useTemporaryMainPath";
    $self->{METHOD_CALL_MAIN_PATH} = "useNormalMainPath";
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of InitDb takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $dbConnectionInfo) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setHelper {
    my ($self, $anyType) = @_;
        $self->{anyType} = $anyType;
}


sub getHelper {
    my ($self) = @_;
        return $self->{anyType};
}


sub getHostName {
    my ($self) = @_;
        try {
            my $dynamicClass = ref($self->{anyType});
            my $method = $dynamicClass->getMethod($self->{METHOD_CALL_GET_HOST_NAME}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            return undef;
        }
}


sub addUsers {
    my ($self) = @_;
        try {
            my $dynamicClass = ref($self->{anyType});
            my $method = $dynamicClass->getMethod($self->{METHOD_CALL_ADD_USERS}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            return 0;
        }
}


sub addDatabases {
    my ($self) = @_;
        try {
            my $dynamicClass = ref($self->{anyType});
            my $method = $dynamicClass->getMethod($self->{METHOD_CALL_ADD_DATABASES}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            return 0;
        }
}


sub addTables {
    my ($self) = @_;
        try {
            my $dynamicClass = ref($self->{anyType});
            my $method = $dynamicClass->getMethod($self->{METHOD_CALL_ADD_TABLES}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            return 0;
        }
}


sub useTemporaryMainPath {
    my ($self) = @_;
        try {
            my $dynamicClass = ref($self->{anyType});
            my $method = $dynamicClass->getMethod($self->{METHOD_CALL_TEMP_MAIN_PATH}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            return 0;
        }
}


sub useNormalMainPath {
    my ($self) = @_;
        try {
            my $dynamicClass = ref($self->{anyType});
            my $method = $dynamicClass->getMethod($self->{METHOD_CALL_MAIN_PATH}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            return 0;
        }
}

# use java::lang::reflect::Method;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::system::security::licensing::LicensingException;

1;

