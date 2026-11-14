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

package org::allbinary::logic::java::help::JavaHelpSetNotifier;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $vector, 'java::lang::LazyStatic', sub { 'org::allbinary::util::BasicArrayListD'->new() };


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub get {
    my ($class) = @_;
        return $org::allbinary::logic::java::help::JavaHelpSetNotifier::vector;
}


sub isNotified {
    my ($class, $helpSet) = @_;
        my $isNotified = 0;
        my $url = $helpSet->getHelpSetURL();
        my $size = $org::allbinary::logic::java::help::JavaHelpSetNotifier::vector->size();
        my $urlArray = $org::allbinary::logic::java::help::JavaHelpSetNotifier::vector->toArray();
        for (my $i = 0; $i < $size; $i++) {
            my $nextURL = $urlArray->[$i];
            if (($url->toString() cmp $nextURL->toString()) == 0) {
                $isNotified = 1;
            }
        }
        $org::allbinary::logic::java::help::JavaHelpSetNotifier::vector->add($url);
        return $isNotified;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::net::URL ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
# use javax::help::HelpSet ();

1;

