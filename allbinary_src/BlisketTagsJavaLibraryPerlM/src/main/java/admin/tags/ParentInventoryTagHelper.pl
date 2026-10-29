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

package admin::tags::ParentInventoryTagHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'admin::tags::ParentInventoryTagHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $admin::tags::ParentInventoryTagHelper::instance;
}


# throws Exception
sub isValid {
    my ($self, $tagClass, $parentTag) = @_;
        if (!defined($parentTag)) {
            die ("Must have parent tag.");
        } elsif (!((Scalar::Util::blessed($parentTag) && $parentTag->isa('tags::HelperTag')))) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Must have at least a ");
            $stringBuffer->append("tags.HelperTag");
            $stringBuffer->append(" as parent");
            $stringBuffer->append("and not: ");
            $stringBuffer->append(ref($parentTag));
            die ($stringBuffer->toString());
        }
}

# use javax::servlet::jsp::tagext::Tag;
use org::allbinary::logic::string::StringMaker;

1;

