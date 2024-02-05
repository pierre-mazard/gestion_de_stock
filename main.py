import mysql.connector
import tkinter as tk
from tkinter import ttk, simpledialog, messagebox

def show_products(category_id):
    # Supprimez les anciennes lignes du tableau
    for i in tree.get_children():
        tree.delete(i)

    # Exécutez une requête pour obtenir les produits de cette catégorie
    cursor.execute("SELECT id, name, description, price, quantity FROM product WHERE id_category = %s", (category_id,))
    
    # Récupérez les résultats
    products = cursor.fetchall()
    
    # Ajoutez les produits au tableau
    for index, product in enumerate(products):
        price = "{} €".format(product[3])  # Ajoutez le symbole euro après le prix
        tree.insert('', 'end', values=(product[1], price, product[4]), tags=(product[0],))
        # Alternance des couleurs de fond pour chaque ligne
        if index % 2 == 0:
            tree.tag_configure(product[0], background='#ffffff')
        else:
            tree.tag_configure(product[0], background='#f2f2f2')

def on_select(event):
    # Récupérez l'ID du produit sélectionné
    selected_item = event.widget.selection()
    product_id = tree.item(selected_item, "tags")[0]

    # Exécutez une requête pour obtenir la description du produit
    cursor.execute("SELECT name, description FROM product WHERE id = %s", (product_id,))
    
    # Récupérez le résultat
    name, description = cursor.fetchone()
    
    # Mettez à jour le label du nom du produit et le texte de description
    product_name_label.config(text=name)
    description_text.delete('1.0', tk.END)
    description_text.insert(tk.END, description)

def add_product():
    # Demandez à l'utilisateur les détails du produit
    name = simpledialog.askstring("Ajouter un produit", "Nom du produit :")
    description = simpledialog.askstring("Ajouter un produit", "Description du produit :")
    price = simpledialog.askfloat("Ajouter un produit", "Prix du produit :")
    quantity = simpledialog.askinteger("Ajouter un produit", "Quantité du produit :")
    id_category = simpledialog.askinteger("Ajouter un produit", "ID de la catégorie du produit :")

    # Exécutez une requête pour ajouter le produit à la base de données
    cursor.execute("INSERT INTO product (name, description, price, quantity, id_category) VALUES (%s, %s, %s, %s, %s)", (name, description, price, quantity, id_category))
    conn.commit()

    # Mettez à jour le tableau
    show_products(id_category)

def delete_product():
    # Récupérez l'ID du produit sélectionné
    selected_item = tree.selection()
    product_id = tree.item(selected_item, "tags")[0]

    # Exécutez une requête pour obtenir l'id_category du produit
    cursor.execute("SELECT id_category FROM product WHERE id = %s", (product_id,))
    id_category = cursor.fetchone()[0]

    # Exécutez une requête pour supprimer le produit de la base de données
    cursor.execute("DELETE FROM product WHERE id = %s", (product_id,))
    conn.commit()

    # Mettez à jour le tableau
    show_products(id_category)

def update_product():
    # Récupérez l'ID du produit sélectionné
    selected_item = tree.selection()
    product_id = tree.item(selected_item, "tags")[0]

    # Demandez à l'utilisateur les nouveaux détails du produit
    name = simpledialog.askstring("Modifier un produit", "Nouveau nom du produit :")
    description = simpledialog.askstring("Modifier un produit", "Nouvelle description du produit :")
    price = simpledialog.askfloat("Modifier un produit", "Nouveau prix du produit :")
    quantity = simpledialog.askinteger("Modifier un produit", "Nouvelle quantité du produit :")
    id_category = simpledialog.askinteger("Modifier un produit", "Nouvel ID de la catégorie du produit :")

    # Exécutez une requête pour mettre à jour le produit dans la base de données
    cursor.execute("UPDATE product SET name = %s, description = %s, price = %s, quantity = %s, id_category = %s WHERE id = %s", (name, description, price, quantity, id_category, product_id))
    conn.commit()

    # Mettez à jour le tableau
    show_products(id_category)

# Créez une fenêtre
window = tk.Tk()
window.title("Gestion des stocks")
window.geometry("800x600")
window.configure(bg="darkblue")

# Créez un label pour le titre
title_label = tk.Label(window, text="Stock Manager", bg="darkblue", fg="white", font=("Helvetica", 16))
title_label.pack()

# Connexion à la base de données Mysql
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root!",
    database="store"
)

# Créez un curseur pour exécuter des requêtes
cursor = conn.cursor()

# Exécutez une requête pour obtenir toutes les catégories
cursor.execute("SELECT * FROM category")

# Récupérez les résultats
results = cursor.fetchall()

# Créez un frame pour les boutons de catégorie
button_frame = tk.Frame(window, bg="darkblue")
button_frame.pack()

# Affichez les catégories avec des boutons
for result in results:
    button = tk.Button(button_frame, text=result[1], bg="white", fg="darkblue", command=lambda result=result: show_products(result[0]))
    button.pack(side=tk.LEFT)

# Créez un frame pour le tableau et la barre de défilement
table_frame = tk.Frame(window)
table_frame.pack(fill=tk.BOTH, expand=True)

# Créez un tableau pour afficher les produits
tree = ttk.Treeview(table_frame, columns=('Nom', 'Prix', 'Quantité'), show='headings')
tree.heading('Nom', text='Nom')
tree.heading('Prix', text='Prix')
tree.heading('Quantité', text='Quantité')
tree.column('Prix', anchor='e')  # Alignez le prix à droite
tree.column('Quantité', anchor='e')  # Alignez la quantité à droite
tree.bind('<<TreeviewSelect>>', on_select)

# Créez une barre de défilement pour le tableau
scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=tree.yview)
scrollbar.pack(side=tk.LEFT, fill=tk.Y)

# Liez la barre de défilement au tableau
tree.configure(yscrollcommand=scrollbar.set)

tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

# Créez des boutons pour ajouter, supprimer et modifier un produit
add_button = tk.Button(window, text="Ajouter un produit", command=add_product)
add_button.pack()

delete_button = tk.Button(window, text="Supprimer un produit", command=delete_product)
delete_button.pack()

update_button = tk.Button(window, text="Modifier un produit", command=update_product)
update_button.pack()


# Créez un frame pour le label de description avec un bord plus épais
description_frame = tk.Frame(window, bg="darkblue", borderwidth=10)
description_frame.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)

# Créez un label pour afficher le nom du produit
product_name_label = tk.Label(description_frame, text="", bg="darkblue", fg="white")
product_name_label.pack()

# Créez un widget Text pour afficher la description du produit
description_text = tk.Text(description_frame, bg="white", fg="darkblue", wrap=tk.WORD)
description_text.pack(fill=tk.BOTH, expand=True)

# Affichez la fenêtre
window.mainloop()

# Fermez le curseur et la connexion
cursor.close()
conn.close()
