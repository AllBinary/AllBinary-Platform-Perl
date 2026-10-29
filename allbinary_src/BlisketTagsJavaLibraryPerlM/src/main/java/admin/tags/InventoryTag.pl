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

package admin::tags::InventoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{storeName} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->setTagHelperFactory('admin::taghelpers::InventoryHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::InventoryRequestHelperFactory'->new());
    return $self;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($self->isEnabled()) {
                if (defined($self->getCommand())) {
                    if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{BACKUP}) != 0 && $self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{RESTORE}) != 0 && $self->getCommand()->compareTo($self->{commonStrings}->{CREATE}) != 0 && $self->getCommand()->compareTo($self->{commonStrings}->{DROP}) != 0) {
                        my $parentTag = $self->getParent();
                        'admin::tags::ParentInventoryTagHelper'->getInstance()->isValid($self, $parentTag);
                        $self->getPropertiesHashMap()->put($admin::tags::AbTagData::PARENT, $parentTag);
                        $self->getPropertiesHashMap()->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
                    }
                    return $self->SUPER::doStartTag();
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::tagext::Tag;
use admin::taghelpers::InventoryHelperFactory;
use admin::taghelpers::InventoryRequestHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use admin::tags::TableTag;
use admin::tags::ParentInventoryTagHelper;
use admin::tags::AbTagData;

1;

