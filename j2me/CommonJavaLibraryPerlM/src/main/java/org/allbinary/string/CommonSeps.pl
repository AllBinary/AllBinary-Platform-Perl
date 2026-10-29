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

package org::allbinary::string::CommonSeps;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::string::CommonSeps'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NEW_LINE} = "\n";
    $self->{SEMICOLON} = ";";
    $self->{EQUALS} = "=";
    $self->{SPACE} = " ";
    $self->{COMMA} = ",";
    $self->{COLON} = ":";
    $self->{PERIOD} = ".";
    $self->{UNDERSCORE} = "_";
    $self->{COLON_SEP} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{COLON})->append($self->{SPACE})->toString();
    $self->{COMMA_SEP} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{COMMA})->append($self->{SPACE})->toString();
    $self->{PARENTHESIS_OPEN} = "(";
    $self->{PARENTHESIS_CLOSE} = ")";
    $self->{BRACE_OPEN} = "{";
    $self->{BRACE_CLOSE} = "}";
    $self->{BRACKET_OPEN} = "[";
    $self->{BRACKET_CLOSE} = "]";
    $self->{DASH} = "-";
    $self->{PERCENT} = "%";
    $self->{AMPERSAND} = "&";
    $self->{FORWARD_SLASH} = "/";
    $self->{BACK_SLASH} = "\\";
    $self->{QUESTION} = "?";
    $self->{QUOTE} = "\"";
    $self->{QUOTE_END} = "\",";
    $self->{COMMENT} = "//";
    $self->{INDENT} = "    ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::string::CommonSeps::instance;
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringMaker;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;

1;

