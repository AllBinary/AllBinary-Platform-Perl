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

package org::allbinary::logic::string::tokens::Tokenizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{sep} = undef;
    $self->{endSep} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $sep) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if (!defined($sep) || 'org::allbinary::TsUtil'->getInstance()->compareTo($sep, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) == 0) {
            die ("Sep provided is not valid");
        }
        $self->{sep} = $sep;
    return $self;
}


sub setSep {
    my ($self, $sep) = @_;
        $self->{sep} = $sep;
}


sub setEndSep {
    my ($self, $endSep) = @_;
        $self->{endSep} = $endSep;
}


sub getInsideSep {
    my ($self, $string) = @_;
        my $tokenList = 'org::allbinary::util::BasicArrayListD'->new();
        my $index = 0;
        my $size = length($string);
        while ($index < $size) {
            $index = index($string, $self->{sep}, $index);
            if ($index != -1) {
                my $end = index($string, $self->{endSep}, $index + length($self->{sep}));
                if ($end != -1) {
                    $tokenList->add(substr($string, $index + length($self->{sep}), ($end - (length($self->{endSep}) - 1)) - ($index + length($self->{sep}))));
                    $index = $end + length($self->{endSep});
                } else {
                }
            } else {
                last;
            }
        }
        return $tokenList;
}


sub getTokensFromString {
    my ($self, $string, $tokenVector) = @_;
        my $index = 0;
        my $end = 0;
        while ($index < length($string)) {
            $end = index($string, $self->{sep}, $index);
            if ($end != -1) {
                $tokenVector->add(substr($string, $index, ($end) - ($index)));
                $index = $end + length($self->{sep});
            } else {
                $tokenVector->add(substr($string, $index, (length($string)) - ($index)));
                last;
            }
        }
        return $tokenVector;
}


sub getTokens {
    my ($self, $stringVector) = @_;
        my $tokenHashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        my $string = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        my $end = 0;
        my $size = $stringVector->size();
        for (my $index = 0; $index < $size; $index++) {
            $string = $stringVector->{objectArray}->[$index];
            $end = index($string, $self->{sep});
            if ($end >= 0) {
                $tokenHashtable->put(substr($string, 0, ($end) - (0)), substr($string, $end + 1, (length($string)) - ($end + 1)));
            }
        }
        return $tokenHashtable;
}

use org::allbinary::TsUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

