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

package org::allbinary::logic::io::file::filter::BasicFileFilterUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $extension) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($extension);
        my $includeFileExtensionsBooleanFileVisitor = 'org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor'->new($vector);
        return 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new($includeFileExtensionsBooleanFileVisitor);
}

# use java::io::FileFilter;
use org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::io::file::filter::VisitorFileFilter;

1;

