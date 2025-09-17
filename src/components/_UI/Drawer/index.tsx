import { ReactNode } from "react";
import { Drawer as UIDrawer } from "@mui/material";
import Button from "@/components/_UI/Button";

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
      {children}
      { toggleDrawer && (
        <Button buttonAction={toggleDrawer}>
          Close
        </Button>
      )}
    </UIDrawer>
  );
};
