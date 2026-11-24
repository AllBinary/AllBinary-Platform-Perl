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

package org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::file::visitor::BooleanFileVisitor';



sub new {
    my ($class, $filterStringBasicArrayList) = @_;
    my $self = $class->SUPER::new($filterStringBasicArrayList);
        # super(...) made $self above
    return $self;
}


sub visit_j1 {
    my ($self, $file) = @_;
        if ($self->getFilterStringBasicArrayList()->size() == 0) {
            return 0;
        }
        return $self->SUPER::visit($file);
}


sub visit_j2 {
    my ($self, $file, $fileNameString) = @_;
        my $fileNameAndExtension = $file->getPath();
        if (length($fileNameAndExtension) > length($fileNameString)) {
            my $startIndex = length($fileNameAndExtension) - length($fileNameString);
            my $fileName = substr($fileNameAndExtension, $startIndex);
            if (($fileName cmp $fileNameString) == 0) {
                return 1;
            }
        }
        return 0;
}

sub visit {
    my ($invocant, @arguments) = @_;
    return $invocant->visit_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->visit_j2(@arguments) if scalar(@arguments) == 2;
    die "No method visit takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::logic::io::file::visitor::BooleanFileVisitor ();

1;

