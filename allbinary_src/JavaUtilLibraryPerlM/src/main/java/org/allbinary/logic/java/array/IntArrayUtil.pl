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

package org::allbinary::logic::java::array::IntArrayUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub toString_j1_1 {
    my ($class, $array) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$array}); $index++) {
            $stringBuffer->appendint($array->[$index]);
            if ($index < scalar(@{$array})) {
                $stringBuffer->append(", ");
            }
        }
        return $stringBuffer->toString();
}


sub toString_j1_2 {
    my ($class, $array) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$array}); $index++) {
            $stringBuffer->append("{");
            for (my $index2 = 0; $index2 < scalar(@{$array->[$index]}); $index2++) {
                $stringBuffer->appendint(int($array->[$index]->[$index2]));
                if ($index2 < scalar(@{$array->[$index]}) - 1) {
                    $stringBuffer->append(", ");
                }
            }
            $stringBuffer->append("}");
            if ($index < scalar(@{$array}) - 1) {
                $stringBuffer->append(", \n");
            }
        }
        return $stringBuffer->toString();
}


sub toString_j1_3 {
    my ($class, $array) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$array}); $index++) {
            $stringBuffer->append("{");
            for (my $index2 = 0; $index2 < scalar(@{$array->[$index]}); $index2++) {
                $stringBuffer->append("{");
                for (my $index3 = 0; $index3 < scalar(@{$array->[$index]->[$index2]}); $index3++) {
                    $stringBuffer->appendint(int($array->[$index]->[$index2]->[$index3]));
                    if ($index3 < scalar(@{$array->[$index]->[$index2]}) - 1) {
                        $stringBuffer->append(", ");
                    }
                }
                $stringBuffer->append("}");
                if ($index2 < scalar(@{$array->[$index]}) - 1) {
                    $stringBuffer->append(", ");
                }
            }
            $stringBuffer->append("}");
            if ($index < scalar(@{$array}) - 1) {
                $stringBuffer->append(", \n");
            }
        }
        return $stringBuffer->toString();
}

sub toString {
    my ($invocant, @arguments) = @_;
    return $invocant->toString_j1(@arguments) if scalar(@arguments) == 1;
    die "No method toString takes " . scalar(@arguments) . " arguments";
}

sub toString_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->toString_j1_1(@arguments) if 1 && (!defined($arguments[0]) || ref($arguments[0]) eq 'ARRAY');
    return $invocant->toString_j1_2(@arguments) if 1 && (!defined($arguments[0]) || ref($arguments[0]) eq 'ARRAY');
    return $invocant->toString_j1_3(@arguments);
}

use java::lang::Object ();
use org::allbinary::logic::string::StringMaker ();

1;

