from flask import Flask, request, jsonify

app = Flask(__name__)

# Ruta de la API
@app.route('/add', methods=['POST'])
def add_mensaje():
    # Recogida y decodificación del mensaje a string
    message = request.data.decode('utf-8')

    if not message:
        return jsonify({"error": "No message provided"}), 400

    # Guardado del mensaje en un archivo
    with open("mensajes.txt", "a+") as file:
        file.write(message + "\n")

    return jsonify({"Exito": True, "mensaje": "Mensaje guardado correctamente", "contenido": message}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
