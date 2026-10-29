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

package org::allbinary::logic::string::StringValidationJSEUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isBlank {
    my ($class, $string) = @_;
        my $len = length($string);
        for (my $i = 0; $i < $len; $i++) {
            my $c = substr($string, $i, 1);
            if (($c =~ /^\s$/) == 0) {
                return 0;
            }
        }
        return 1;
}


1;

