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

package org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionBooleanFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{includesString} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of DirectoryOrIncludeFileExtensionBooleanFileVisitor takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $filterStringBasicArrayList) = @_;
    my $self = $class->SUPER::new($filterStringBasicArrayList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{includesString} = undef;
    return $self;
}


sub _new2 {
    my ($class, $filterStringBasicArrayList, $includesString) = @_;
    my $self = $class->SUPER::new($filterStringBasicArrayList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{includesString} = $includesString;
    return $self;
}


sub visit {
    my ($self, $file) = @_;
        if ($file->isDirectory()) {
            return 1;
        }
        if (!defined($self->{includesString}) || $file->getAbsolutePath()->indexOf($self->{includesString}) >= 0) {
            return $self->SUPER::visit($file);
        } else {
            return 0;
        }
}

use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor;
use org::allbinary::util::BasicArrayList;

1;

