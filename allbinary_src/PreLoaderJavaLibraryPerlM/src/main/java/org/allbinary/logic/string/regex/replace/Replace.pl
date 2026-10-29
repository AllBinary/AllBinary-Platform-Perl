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

package org::allbinary::logic::string::regex::replace::Replace;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{j2seUtil} = 'org::allbinary::J2SEUtil'->getInstance();
    $self->{REPLACERS_} = "Replacers: ";
    $self->{ALL} = "all";
    $self->{FOUND_KEY} = "found key total: ";
    $self->{hashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of Replace takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $key, $value) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{hashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{hashMap}->put([$key], [$value]);
    return $self;
}


sub _new2 {
    my ($class, $keys, $values) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{hashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{hashMap}->put($keys, $values);
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{hashMap} = $hashMap;
    return $self;
}


sub all {
    my ($self, $replace) = @_;
        return $self->upTo($replace, (-2147483648));
}


sub upTo {
    my ($self, $replace, $total) = @_;
        my $newStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $totalNumberOfReplaces = 0;
        my $keys = undef;
        my $values = undef;
        my $keyArray = $self->{j2seUtil}->getHashMapAsArray($self->{hashMap});
        my $size = scalar(@{$keyArray});
        for (my $index2 = 0; $index2 < $size; $index2++) {
            $keys = $keyArray->[$index2];
            $values = $self->{hashMap}->get($keys);
            my $foundTotal = 0;
            my $index = 0;
            my $nextKey = undef;
            my $end = 0;
            my $nextSecondKey = undef;
            my $begin2 = 0;
            while ($index < length($replace)) {
                my $begin = index($replace, $keys->[0], $index);
                if ($begin != -1) {
                    $foundTotal++;
                    if ($foundTotal % 100 == 0) {
                        print($self->{FOUND_KEY} . $foundTotal, "\n");
                    }
                    $nextKey = $keys->[0];
                    $end = $begin + length($nextKey);
                    $newStringBuffer->delete(0, $newStringBuffer->length());
                    $newStringBuffer->append(substr($replace, 0, ($begin) - (0)));
                    $newStringBuffer->append($values->[0]);
                    $index = $newStringBuffer->length();
                    $newStringBuffer->append(substr($replace, $end, (length($replace)) - ($end)));
                    $replace = $newStringBuffer->toString();
                    if (scalar(@{$keys}) > 1) {
                        $nextSecondKey = $keys->[1];
                        $begin2 = index($replace, $nextSecondKey, $index);
                        if ($begin2 != -1) {
                            my $end2 = $begin2 + length($nextSecondKey);
                            $newStringBuffer->delete(0, $newStringBuffer->length());
                            $newStringBuffer->append(substr($replace, 0, ($begin2) - (0)));
                            $newStringBuffer->append($values->[1]);
                            $index = $newStringBuffer->length();
                            $newStringBuffer->append(substr($replace, $end2, (length($replace)) - ($end2)));
                            $replace = $newStringBuffer->toString();
                        }
                    }
                    $totalNumberOfReplaces++;
                    if ($total != (-2147483648) && $totalNumberOfReplaces >= $total) {
                        last;
                    }
                } else {
                    last;
                }
            }
        }
        if ($totalNumberOfReplaces > 0) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains($org::allbinary::logic::string::regex::replace::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{REPLACE})) {
                $self->{logUtil}->putF("Total Number Of Replaces: " . $totalNumberOfReplaces, $self, $self->{ALL});
            }
        }
        return $replace;
}


sub line {
    my ($self, $replace) = @_;
        my $newStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $totalNumberOfReplaces = 0;
        my $key = undef;
        my $value = undef;
        my $keyArray = $self->{j2seUtil}->getHashMapAsArray($self->{hashMap});
        my $size = scalar(@{$keyArray});
        for (my $index2 = 0; $index2 < $size; $index2++) {
            $key = $keyArray->[$index2];
            $value = $self->{hashMap}->get($key);
            my $index = 0;
            while ($index < length($replace)) {
                $newStringBuffer->delete(0, $newStringBuffer->length());
                my $begin = index($replace, $key, $index);
                if ($begin != -1) {
                    print($self->{FOUND_KEY}, "\n");
                    my $end = index($replace, "\n", $begin + length($key)) + 1;
                    if ($end >= 0) {
                        $newStringBuffer->append(substr($replace, 0, ($begin) - (0)));
                        $index = $newStringBuffer->length();
                        $newStringBuffer->append(substr($replace, $end, (length($replace)) - ($end)));
                        $replace = $newStringBuffer->toString();
                        $totalNumberOfReplaces++;
                    }
                } else {
                    last;
                }
            }
        }
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains($org::allbinary::logic::string::regex::replace::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{REPLACE})) {
            $self->{logUtil}->putF("Total Number Of Replaces: " . $totalNumberOfReplaces, $self, $self->{ALL});
        }
        return $replace;
}


sub main {
    my ($class, $args) = @_;
        try {
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            my $appUrlGlobals = 'org::allbinary::globals::AppUrlGlobals'->new();
            $appUrlGlobals->setWebappPath("G:/mnt/bc/mydev/work/allbinary_src/ToolsJavaLibrary/tools");
            'org::allbinary::globals::URLGLOBALS'->init($appUrlGlobals);
            my $testString = "\"super gun\" big tank \"goodgunriflegun";
            my $replace = 'org::allbinary::logic::string::regex::replace::Replace'->new("gun", "abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz");
            print("Old String: " . $testString, "\n");
            $testString = $replace->all($testString);
            print("New String: " . $testString, "\n");
            my $replaceCat = 'org::allbinary::logic::string::regex::replace::Replace'->new("abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz", $stringUtil->{EMPTY_STRING});
            $testString = $replaceCat->all($testString);
            print("New String: " . $testString, "\n");
        } catch ($e) {
        }
}

use java::util::HashMap;
use org::allbinary::J2SEUtil;
use org::allbinary::globals::AppUrlGlobals;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use java::lang::System;

1;

