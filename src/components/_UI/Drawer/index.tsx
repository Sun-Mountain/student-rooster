import { ReactNode } from "react";
import { Drawer as UIDrawer } from "@mui/material";
import Button from "@/components/_UI/Button";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTimes } from "@fortawesome/free-solid-svg-icons";

interface DrawerProps {
  children: ReactNode;
  drawerOpen: boolean;
  anchor?: 'left' | 'right' | 'top' | 'bottom';
  toggleDrawer?: () => void;
}

export const Drawer = ({
  children,
  drawerOpen = false,
  anchor = 'right',
  toggleDrawer
}: DrawerProps) => {
  return (
    <UIDrawer open={drawerOpen} onClose={toggleDrawer} anchor={anchor}>
      <div className="drawer-nav">
        { toggleDrawer && (
          <div className="drawer-btn-container">
            <Button buttonAction={toggleDrawer} className="icon">
              <FontAwesomeIcon icon={faTimes} />
            </Button>
          </div>
        )}
        {children}
      </div>
    </UIDrawer>
  );
};
